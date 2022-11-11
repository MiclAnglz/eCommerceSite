/**
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken  
 * Class Day: Thursay
 * Class Time: 2pm
 */

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; 
var yyyy = today.getFullYear();
var expiry = document.getElementById("Expiry");
var orderDate = document.getElementById("date");
today = dd+'/'+ mm +'/'+yyyy; 
var credCrdEx = /^\d{4}(\s?)\d{4}(\s?)\d{4}(\s?)\d{4}$/;                           //regex only accepts 16 digits
var expDateEx = /^(0[1-9]|1[0-2])\/\d\d$/;                                         //regex to accept mm/yyy format only                 
var threeDigitsEx = /^\d{3}$/;                                                     //regex only three digits allowed to be inputted
var onlyCharactersEx = /^[a-zA-z\s]+$/;                                            //regex only characters, space and hyphans                      
var charOnlyHyphSpace = /^[a-zA-z\s-]+$/;                                          //regex  only caracter and space                    
var oDateRexEx = /^(0[1-9]|1[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/\d{4}$/;        //regex to accept dd/mm/yyy format only
var onlyCharactersEx = /^[a-zA-z\s]+$/;                                            //regex only accepts characters
var firstLCap = /^[A-Z][a-z]*$/;                                                   //regex only accepts uppercase for the first letter
var postCodeEx = /^([2-7]\d\d\d|0[8-9]\d\d)$/;    
var emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]*)\.([a-zA-Z]{2,3})(\.[a-zA-Z]{2,3})?$/;       //regex only accepts vaild email addresses
var pWordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;                           //regex only accepts Password that are 8 characters long and must include at least 1 number [0-9]
var anyDigExp = /^-?\d*$/;                                                         ////regex only accepts digits.                       
var alphaCharAndOneInvtCommaRegEx = /^[a-zA-Z]*""{1}[a-zA-Z]*$/                    //regex onlay accepts characters and single inverted commas.
var credCrdEx = /^\d{4}(\s?)\d{4}(\s?)\d{4}(\s?)\d{4}$/;  
document.getElementById("currentYear").innerHTML = yyyy;
 /**
 * 
 * @param {*} form refers directly to the form the function is attached to. 
 * @returns 
 */
  function validatePaymentForm(form){

    let valid = true;   //assume the form is valid to start with

    if (!regExpValidation("creditCard1", credCrdEx, "creditCard1Error")) {
        valid= false;
    }

    if (!regExpValidation("CCV", threeDigitsEx, "CCVError")) {
        valid= false;
    }

    if (!regExpValidation("cardHoldersName", onlyCharactersEx, "chnError")) {
        valid = false;
    }

    if (valMonthYr(expiry) && !regExpValidation("Expiry", expDateEx, "expyError")) {
        valid = false;
    }

    if (validateRadioButtons(form.cardType)) {
    valid = false
    }

    return valid;

  }

creditCard1.addEventListener("blur", function(){  

    if (!regExpValidation("creditCard1", credCrdEx, "creditCard1Error")) {
        valid = false;
        }
    
    })
      
    
    CCV.addEventListener("blur", function(){
    
        if (!regExpValidation("CCV", threeDigitsEx, "CCVError")) {
            valid = false;
        }
    
    })
    
    cardHoldersName.addEventListener("blur", function(){
    
        if (!regExpValidation("cardHoldersName", onlyCharactersEx, "chnError")) {
            valid = false;
        }
    
    })
    
    Expiry.addEventListener("blur", function(){
    
        if (valMonthYr(expiry) && !regExpValidation("Expiry", expDateEx, "expyError")) {
            valid = false;
        }
    
    })

/**
 * 
 * @param {*} item - passes the element to be validated
 * @param {*} regEx  - passed the specified reg expression code.
 * @param {*} msg - passes the error messages assigned to specific validations
 * @returns return false if validation rules are not met.
 */

 function regExpValidation(item, regEx, msg) {

    if (!regEx.test(document.getElementById(item).value)) {

        document.getElementById(msg).style.display = "inline-block";
        document.getElementById(item).style.border = "1px red dashed"
        return false;
    }
    document.getElementById(msg).style.display = "none";
    document.getElementById(item).style.border = "1px solid grey"
    return true;

}

/**
 * this codes is used to determine if a txt box has a null value
 * 
 * @param {*} ident - passes the element to be validated
 * @param {*} msg - passes the error messages assigned to specific validations
 * @returns 
 */

 function requiredFieldEmpty(ident, msg) {

    if (!document.getElementById(ident).value.length) {  
                                       //form is not valid
        document.getElementById(msg).style.display = "inline-block";  
        document.getElementById(ident).style.border = "1px red dashed"                  //show the error message
        return false;
    }else{

    document.getElementById(msg).style.display = "none"; 
    document.getElementById(ident).style.border = "1px solid grey"                          //hide the error message                                                                                     //set the border back to normal
    return true;
    }
}

/**
 * used to validate the expiry for the credit card.
 * this code is similar to the above code.  the only difference that it doesnt not take the day into consideration 
 * only month and yr.
 * @param {*} element - passes the expiry element 
 * @returns false if the user enter a mm/yy that is in the past. 
 */

 function valMonthYr(element){

    let str = element.value;
    let parts = str.split('/');
    let useMonthYr = new Date( 2000 + parseInt(parts[1]), parseInt(parts[0]), 0); 
    let currMonthYr = new Date (yyyy, mm, 0);
    let msec = Date.parse(useMonthYr);
    let msec1 = Date.parse(currMonthYr);

    if(msec < msec1){

        document.getElementById("expyError").style.display = "inline-block";
        return false;
    
    }else{

        document.getElementById("expyError").style.display = "none";     
        return true;
    }
}
/**
 * this validates the radio button
 * 
 * @param {*} element passes the name radioB 
 * @returns 
 */
function validateRadioButtons (element){
    if(!element.value.length) {
        document.getElementById('radioB').style.display = "inline-block";
        return true;
    } else{
        document.getElementById('radioB').style.display = "none"; 
    }
  }