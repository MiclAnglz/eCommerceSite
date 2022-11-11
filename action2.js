/**
 * Student ID: 20455936
 * Name: Michael Angeles
 * Campus:  Parramatta South
 * Tutor Name: Kieran Luken  
 * Class Day: Thursay
 * Class Time: 2pm
 */ 

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
 var pWordReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8}$/;                           //regex only accepts Password that are 8 characters long and must include at least 1 number [0-9]
 var anyDigExp = /^-?\d*$/;                                                         ////regex only accepts digits.                       
 var alphaCharAndOneInvtCommaRegEx = /^[a-zA-Z]*""{1}[a-zA-Z]*$/                    //regex onlay accepts characters and single inverted commas.
 var credCrdEx = /^\d{4}(\s?)\d{4}(\s?)\d{4}(\s?)\d{4}$/; 


function validateForm(form) {

    let valid = true;   //assume the form is valid to start with

    
    if (!regExpValidation("fname", firstLCap, "fNameError")) {
        valid = false;
    }

    if (!regExpValidation("lname", firstLCap, "lNameError")) {
        valid = false;
    }

    if (!regExpValidation("streetAddress", onlyCharactersEx, "streetAddyError")) {
        valid = false;
    }

    if (!regExpValidation("suburbCity", onlyCharactersEx, "suburbError")) {
        valid = false;
    }

    if (!requiredFieldEmpty("State", "stateError")) {
        valid = false;
    }

    if (!regExpValidation("Postcode", postCodeEx, "postCodeError")) {
        valid = false;
    }

    if (!streetNumberVal()) {
        valid = false;
    }

    return valid;
}


fname.addEventListener("blur", function(){

    if (!regExpValidation("fname", firstLCap, "fNameError")) {
        valid = false;
    }
    
})

lname.addEventListener("blur", function(){

    if (!regExpValidation("lname", firstLCap, "lNameError")) {
        valid = false;
    }
    
})

streetAddress.addEventListener("blur", function(){

    if (!regExpValidation("streetAddress", onlyCharactersEx, "streetAddyError")) {
        valid = false;
    }
    
})

suburbCity.addEventListener("blur", function(){

    if (!regExpValidation("suburbCity", onlyCharactersEx, "suburbError")) {
        valid = false;
    }
    
})

Postcode.addEventListener("blur", function(){

    if (!regExpValidation("Postcode", postCodeEx, "postCodeError")) {
        valid = false;
    }
    
})

State.addEventListener("blur", function(){

    if (!requiredFieldEmpty("State", "stateError")) {
        valid = false;
    }
    
})

cNumber.addEventListener("blur", function(){

    if (!streetNumberVal()) {
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
 * this function validates the street number to be greater than zero.
 * 
 * @param {*} streetNumberVal - parsing the value of the street number
 */
 function streetNumberVal(){

    let sNumberVal = document.getElementById("cNumber").value; 

    if (sNumberVal <= 0 || sNumberVal == " " ){
    
    document.getElementById("missingNumber").style.display = "inline-block";  
    document.getElementById("cNumber").style.border = "1px red dashed" //show the error message
                     
    return false;

    } else {

    document.getElementById("missingNumber").style.display = "none"; 
    document.getElementById("cNumber").style.border = "1px solid grey"                          //hide the error message                                                                                     //set the border back to normal
    return true;
    }  
}
   
