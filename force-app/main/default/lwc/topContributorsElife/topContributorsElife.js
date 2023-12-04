import { LightningElement, wire } from 'lwc';
import fetchTopContributors from '@salesforce/apex/ManageDonationElife.fetchTopContributors';

export default class TopContributorsElife extends LightningElement {
    contributors = [];
    columns = [
        { label: 'Name', fieldName: 'displayedName', type: 'text' },
        { label: 'Donation Amount', fieldName: 'Total_Donation__c', type: 'currency', typeAttributes: { currencyCode: 'USD' } }
    ];

    @wire(fetchTopContributors)
    wiredContributors({ error, data }) {
        if (data) {
            this.contributors = data.map(record => {
                let displayedName = record.Anonymous__c ? 'Anonymous' : record.Name;
                return { ...record, displayedName };
            });
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contributors = undefined;
        }
    }
}