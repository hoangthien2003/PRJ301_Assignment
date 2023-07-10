/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $("#userIDInput").focus(function() {
        $("#userIDBorder").css("border", "")
        $("#userIDHintError").html(null)
        $("#userIDBorder").removeClass("border-error")
        $("#userIDBorder").addClass("border-focus")
    }).blur(function() {
        $("#userIDBorder").removeClass("border-focus")
    })
    $("#fullNameInput").focus(function() {
        $("#fullNameBorder").css("border", "")
        $("#fullNameHintError").html(null)
        $("#fullNameBorder").removeClass("border-error")
        $("#fullNameBorder").addClass("border-focus")
    }).blur(function() {
        $("#fullNameBorder").removeClass("border-focus")
    })
    $("#passwordInput").focus(function() {
        $("#passwordBorder").css("border", "")
        $("#passwordHintError").html(null)
        $("#passwordBorder").removeClass("border-error")
        $("#passwordBorder").addClass("border-focus")
    }).blur(function() {
        $("#passwordBorder").removeClass("border-focus")
    })
    $("#confirmInput").focus(function() {
        $("#confirmBorder").css("border", "")
        $("#confirmHintError").html(null)
        $("#confirmBorder").removeClass("border-error")
        $("#confirmBorder").addClass("border-focus")
    }).blur(function() {
        $("#confirmBorder").removeClass("border-focus")
    })
})