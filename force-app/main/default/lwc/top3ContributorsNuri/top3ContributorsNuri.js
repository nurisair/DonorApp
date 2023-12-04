import { LightningElement, wire } from 'lwc';
import fetchTopContributors from '@salesforce/apex/ManageDonationNuri.fetchTopContributors';

const COLUMNS = [
    { label: "Name", fieldName: "Name", type: "text" },
    { label: "Donation Amount", fieldName: "Total_Donation__c", type: "currency" }
];


export default class Top3ContributorsNuri extends LightningElement {
    
    columns = COLUMNS;
    
    @wire(fetchTopContributors)
    accounts;

}