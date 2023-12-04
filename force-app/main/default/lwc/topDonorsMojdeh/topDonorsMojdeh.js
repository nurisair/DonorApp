import { LightningElement, wire } from 'lwc';
import Top3Contributors
 from '@salesforce/apex/ManageDonation_Mojdeh.Top3Contributors';
export default class TopDonorsMojdeh extends LightningElement {
    account;
    @wire(Top3Contributors)
    wiredAccounts({error,data}){
        if(data){
            this.account=data;
        }
        else if(error){
            console.error(error);
        }
    }
}