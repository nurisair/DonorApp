import { LightningElement, wire } from 'lwc';
import getTopContributors from '@salesforce/apex/ManageDonationMehtap.getTopContributors';

const COLUMNS = [
    { label: "Name", fieldName: "Name", type: "text" },
    { label: "Donation Amount", fieldName: "Total_Donation__c", type: "currency" },
];

export default class TopContributorsComponent extends LightningElement {
    columns = COLUMNS;
    topContributors;

    @wire(getTopContributors)
    wiredTopContributors({ data, error }) {
        if (data) {
            this.topContributors = data;
        } else if (error) {
            console.error(error);
        }
    }
}