import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import getRecordForm from '@salesforce/apex/TopDonorsController.getRecordForm'; // Replace with your Apex method name

import CAMPAIGN_OBJECT from '@salesforce/schema/Campaign';

export default class CampaignInfo extends LightningElement {
    recordTypeId;
    campaignInfo;

    @wire(getObjectInfo, { objectApiName: CAMPAIGN_OBJECT })
    campaignData({ data, error }) {
        if (data) {
            JSON.stringify('Data ');
            this.campaignInfo = data;
            JSON.stringify('Data ' + JSON.stringify(this.campaignInfo));
            this.recordTypeId = this.campaignInfo.data.defaultRecordTypeId;
        }
        if (error) {
            JSON.stringify('Error ' + JSON.stringify(error));
        }
    }

    // Call your Apex method when you have the required recordTypeId.
    callApexMethod() {
        getRecordForm({ recordTypeId: this.recordTypeId })
            .then(result => {
                // Handle the result from the Apex method here
                console.log(result);
            })
            .catch(error => {
                // Handle any errors from the Apex method here
                console.error(error);
            });
    }
}