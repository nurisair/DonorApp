import { LightningElement, wire } from 'lwc';
import getTopDonors from '@salesforce/apex/TopDonorsController.getTopDonors';

export default class TopDonorsComponent extends LightningElement {
    topDonors;
    error;

    @wire(getTopDonors)
    wiredTopDonors({ data, error }) {
        if (data) {
            this.topDonors = data;
        } else if (error) {
            this.error = error;
        }
    }
}