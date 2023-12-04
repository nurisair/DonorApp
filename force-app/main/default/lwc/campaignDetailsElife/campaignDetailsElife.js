import { LightningElement,api } from 'lwc';
import CAMPAIGN_OBJECT from '@salesforce/schema/Campaign';
import NAME_FIELD from '@salesforce/schema/Campaign.Name';
import TARGET_DONATION_AMOUNT_FIELD from '@salesforce/schema/Campaign.Target_Donation_Amount__c';
import ACHIEVED_DONATION_AMOUNT_FIELD from '@salesforce/schema/Campaign.Achieved_Donation_Amount__c';
import REMAINING_DONATION_AMOUNT_FIELD from '@salesforce/schema/Campaign.Remaining_Donation_Amount__c';
import ENDDATE_FIELD from '@salesforce/schema/Campaign.EndDate';

//

export default class CampaignDetailsElife extends LightningElement {
    @api recordId;//This is the public variable to get the record ID from a parent component or when this LWC is used on a record page.
    fields=['Name','Target_Donation_Amount__c', 'Achieved_Donation_Amount__c', 'Remaining_Donation_Amount__c', 'EndDate'];

}