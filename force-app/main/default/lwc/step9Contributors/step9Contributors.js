import fetchTopContributors from '@salesforce/apex/ManageDonationTubaK.fetchTopContributors';
import { LightningElement, wire } from 'lwc';

export default class Step9Contributors extends LightningElement {

    accData;
    accError;

    @wire(fetchTopContributors)
    accFetch({ data, error }){
        if (data) {
            console.log(data);
            this.accData = data.map(record => {
                let displayedName = record.Anonymous__c ? 'Anonymous' : record.Name;
                return {...record, displayedName};
            });
            this.accError = undefined;
 
        }else if(error) {
            this.accData = undefined;
            this.accError = error;
        }
    }
    
}