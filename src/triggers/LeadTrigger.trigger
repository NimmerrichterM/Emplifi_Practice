/**
 * Created by Home on 14.09.2022.
 */

trigger LeadTrigger on Lead (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if(Trigger.isInsert || Trigger.isUpdate){
        if(Trigger.isAfter){
            if(!PreventRecursion.firstRun){
                PreventRecursion.firstRun = true;
                LeadTriggerHandler.updateLead(Trigger.New);
            }
        }
    }
}