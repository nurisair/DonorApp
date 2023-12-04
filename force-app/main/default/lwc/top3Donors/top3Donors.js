import { LightningElement, wire } from 'lwc';
import fetchTopContributors from '@salesforce/apex/ManageDonation.fetchTopContributors';

export default class top3Donors extends LightningElement {
    topDonors = [];

    @wire(fetchTopContributors)
    wiredContributors({ error, data }) {
        if (data) {
            this.topDonors = data;
        } else if (error) {
            // Handle error
        }
    }
}