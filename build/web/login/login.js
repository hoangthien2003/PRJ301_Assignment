/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var borderUserID = document.getElementById("borderUserID");
var borderPassword = document.getElementById("borderPassword");
var inputUserID = document.getElementById("inputUserID");
var inputPassword = document.getElementById("inputPassword");
var spanError = document.getElementById("spanError")
if (spanError !== null) {
    borderUserID.classList.add('border-error')
    borderPassword.classList.add('border-error')
}
inputUserID.addEventListener('focus', () => {
    borderUserID.classList.add('border-focus')
    borderUserID.classList.remove('border-error')
});
inputUserID.addEventListener('blur', () => {
    borderUserID.classList.remove('border-focus')
});
inputPassword.addEventListener('focus', () => {
    borderPassword.classList.add('border-focus')
    borderPassword.classList.remove('border-error')
});
inputPassword.addEventListener('blur', () => {
    borderPassword.classList.remove('border-focus')
});