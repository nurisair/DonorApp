import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Campaign.Name';
import TARGETDONATIONAMOUNT_FIELD from '@salesforce/schema/Campaign.Target_Donation_Amount__c';
import ACHIVEDDONATIONAMOUNT_FIELD from '@salesforce/schema/Campaign.Achieved_Donation_Amount__c';
import REMAININGDONATIONAMOUNT_FIELD from '@salesforce/schema/Campaign.Remaining_Donation_Amount__c';
import ENDDATE_FIELD from '@salesforce/schema/Campaign.EndDate';

export default class CampaignDetails extends LightningElement {
    @api recordId;
    @api objectApiName;

    campaignNameField = NAME_FIELD;
    campaignTargetDonationAmountField = TARGETDONATIONAMOUNT_FIELD;
    campaignAchievedDonationAmountField = ACHIVEDDONATIONAMOUNT_FIELD;
    campaignRemainingDonationAmountField = REMAININGDONATIONAMOUNT_FIELD;
    campaignEndDateField = ENDDATE_FIELD;

    connectedCallback() {
        console.log('recordId: '+this.recordId);
        console.log('objectApiName: '+this.objectApiName);
    }
}