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
 var credCrdEx = /^\d{4}(\s?)\d{4}(\s?)\d{4}(\s?)\d{4}$/;                           //regex only accepts 16 digits
 var today = new Date();
 var dd = today.getDate();
 var mm = today.getMonth()+1; 
 var yyyy = today.getFullYear();
 var expiry = document.getElementById("Expiry");
 var orderDate = document.getElementById("date");
 today = dd+'/'+ mm +'/'+yyyy;                                                       //sets todays date
                                                    

 /**
 * 
 * @param {*} form refers directly to the form the function is attached to. 
 * @returns 
 */
 function validateCartForm1(form){ 

    let valid = "true";

    let dbStock = parseInt(document.getElementById('hiddenQyt1').value);            //retrieving hidden element from the form
    let qty = parseInt(document.getElementById('pQty1').value);                     //the value of qty on the form

    // will disable the add to cart button if valid returns false. 
    if (qty == 0 || qty == "" ) {
        document.getElementById('atcPress').disabled = true;
        document.getElementById('sErrors1').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
        valid = false;
    }

    if (qty > dbStock ) {

        document.getElementById('atcPress').disabled = true;
        document.getElementById('s1Error').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
        valid = false;
    }

    if (qty < 1 ) {

        document.getElementById('atcPress').disabled = true;
        document.getElementById('sErrors1').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
        valid = false;
    }

    return valid;
 }

 /**
 * 
 * @param {*} form refers directly to the form the function is attached to. 
 * @returns 
 */
  function validateCartForm(form){ 

    let valid = "true";

    let dbStock = parseInt(document.getElementById('hiddenQyt').value);            //retrieving hidden element from the form
    let qty = parseInt(document.getElementById('pQty').value);                     //the value of qty on the form

    // will disable the add to cart button if valid returns false. 
    if (qty == 0 || qty == "") {
        document.getElementById('searchatc').disabled = true;
        document.getElementById('sErrors').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed"
        valid = false;
    }
    
    if (dbStock < qty) {
        
        document.getElementById('sError').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed"
        document.getElementById('searchatc').disabled = true;
        valid = false;
    }

    if (qty < 1) {

        document.getElementById('searchatc').disabled = true;
        document.getElementById('sErrors').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed";
        valid = false;
    }

    return valid;
 }
 
 function validateForm(form) {

    let valid = true;   //assume the form is valid to start with
    
    if (!regExpValidation("email", emailRegex, "emailError")) {
        valid = false;
    }

    if (!regExpValidation("pword", pWordReg, "pWordError")) {
        valid = false;
    }

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

    if (!compare()) {
        valid = false;
    } 

    return valid;

}

//  the following codes is written to validate the users input with the regex using onblur.
pword.addEventListener("blur", function(){

    if (!regExpValidation("pword", pWordReg, "pWordError")) {
        valid = false;
    }
    
})

email.addEventListener("blur", function(){

    if (!regExpValidation("email", emailRegex, "emailError")) {
        valid = false;
    }
    
})

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
 * this codes is used to validate the qty before adding to cart
 * 
 * @param {*} element - passes the element to be validated
 */
function qtyval1(element) {
    
    let dbStock = parseInt(document.getElementById('hiddenQyt1').value);
    let qty = parseInt(element.value);
    let condition1 = false;
    let condition2 = false;
    

    if (qty > dbStock ) {

        document.getElementById('atcPress').disabled = true;
        document.getElementById('s1Error').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
        condition1 = true;
        condition2 = true;
  
    
    } else {

        document.getElementById('atcPress').disabled = false;
        document.getElementById('s1Error').style.display = "none";
        document.getElementById('pQty1').style.border = "1px solid grey"
    }

   
    
    if (qty < 1 ) {

        document.getElementById('atcPress').disabled = true;
        document.getElementById('sErrors1').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
        condition2 = true;
        condition1 = true;

    
    } else {
        
        if(condition1 == false){
            
            document.getElementById('atcPress').disabled = false;
            document.getElementById('sErrors1').style.display = "none";
            document.getElementById('pQty1').style.border = "1px solid grey";
        }
    }  
    


    if (!anyDigExp.test(qty)){

        document.getElementById('atcPress').disabled = true;
        document.getElementById('sErrors1').style.display = "inline-block";
        document.getElementById('pQty1').style.border = "1px red dashed"
     

    } else {
        
        if(condition2 == false || condition1 == false) {
            document.getElementById('atcPress').disabled = false;
            document.getElementById('sErrors1').style.display = "none";
            document.getElementById('pQty1').style.border = "1px solid grey";
        }

    }
}

/**
 * this codes is used to validate the qty before adding to cart
 * 
 * @param {*} element - passes the element to be validated
 */
function qtyval(element) {

    let dbStock = parseInt(document.getElementById('hiddenQyt').value);
    let qty = parseInt(element.value);
    let condition1 = false;
    let condition2 = false;
   
    if (dbStock < qty) {
        
        document.getElementById('sError').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed"
        document.getElementById('searchatc').disabled = true;
        condition1 = true;
        condition2 = true;

    } else {
        
        document.getElementById('searchatc').disabled = false;
        document.getElementById('sError').style.display = "none";
        document.getElementById('pQty').style.border = "1px solid grey";
        
        
    }

    //this if statement prevents the first condition from entering the values if this condistion
    if (qty < 1) {

        document.getElementById('searchatc').disabled = true;
        document.getElementById('sErrors').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed";
        condition2 = true;
        condition1 = true;

    } else {

        if (condition1 == false ){
            document.getElementById('searchatc').disabled = false;
            document.getElementById('sErrors').style.display = "none";
            document.getElementById('pQty').style.border = "1px solid grey"
        }   
    }
    if (!anyDigExp.test(qty)) {

        document.getElementById('searchatc').disabled = true;
        document.getElementById('sErrors').style.display = "inline-block";
        document.getElementById('pQty').style.border = "1px red dashed";
        condition2 = true;

    } else {

        if (condition1 == false || condition2 == false) {
            document.getElementById('searchatc').disabled = false;
            document.getElementById('sErrors').style.display = "none";
            document.getElementById('pQty').style.border = "1px solid grey"
        }   
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

/**
 * this function is to confirm that the user has entered the right password 
 * 
 * @returns true or false
 * 
 */

function compare() {

    let pWordVal = document.getElementById("pword").value; 
    let pConfirmVal = document.getElementById("cPWord").value; 

    let result = pWordVal.localeCompare(pConfirmVal);                                   //test if both confirm and the normal password match.

    if(result > 0 || result < 0 ){

    document.getElementById("CpWordError").style.display = "inline-block";  
    document.getElementById("pword").style.border = "1px red dashed"                    //show the error message
    document.getElementById("cPWord").style.border = "1px red dashed"                
    return false;

    } else {

    document.getElementById("CpWordError").style.display = "none"; 
    document.getElementById("cPWord").style.border = "1px solid grey" 
    document.getElementById("pword").style.border = "1px solid grey"                         //hide the error message                                                                                     //set the border back to normal
    return true;
    
    }
}






