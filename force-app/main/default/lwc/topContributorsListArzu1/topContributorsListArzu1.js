/*import { LightningElement, wire } from 'lwc';
import getTopContributors from '@salesforce/apex/ManageDonationArzu.getTopContributors';



export default class TopContributorsListArzu1 extends LightningElement {
    topContributors;
    error;

    @wire(getTopContributors)
    wiredContributors({ error, data }) {
        if (data) {
            this.topContributors = data;

            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.topContributors = undefined;
        }
    }
}*/


import { LightningElement, wire } from 'lwc';

import getTopContributors from '@salesforce/apex/ManageDonationArzu.getTopContributors';

// Define the columns for the data table
const columns = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Donation Amount', fieldName: 'Total_Donation__c', type: 'currency' }
];

export default class topContributorsArzu1 extends LightningElement {
    topContributors;
    columns = columns; // Assign the columns to the component

    // Initialize the error variable
    error;

    @wire(getTopContributors)
    wiredContributors({ error, data }) {
        if (data) {
            // If data is retrieved successfully, map the data and set it to the component's topContributors property
            this.topContributors = data.map(record => {
                let displayedName = record.Anonymous__c ? 'Anonymous' : record.Name;
                return { ...record, displayedName };
            });
            this.error = undefined; // Clear any previous error
        } else if (error) {
            this.error = error; // Set the error if there's an issue
            this.topContributors = undefined; // Clear any previous data
            console.log('Data from Apex:', data);

        }
    }
}