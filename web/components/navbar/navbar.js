/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $("#profile").mouseenter(function() {
        $("#profile").addClass("nav-hover")
    }).mouseleave(function() {
        $("#profile").removeClass("nav-hover")
    })
    
    $("#cart").mouseenter(function() {
        $("#cart").addClass("nav-hover")
    }).mouseleave(function() {
        $("#cart").removeClass("nav-hover")
    })
    
    $("#favourite").mouseenter(function() {
        $("#favourite").addClass("nav-hover")
    }).mouseleave(function() {
        $("#favourite").removeClass("nav-hover")
    })
    
    $("#logout").mouseenter(function() {
        $("#logout").addClass("nav-hover-logout")
    }).mouseleave(function() {
        $("#logout").removeClass("nav-hover-logout")
    })
})