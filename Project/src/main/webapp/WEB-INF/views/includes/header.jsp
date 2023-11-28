<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html14/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="../resources/images/favicon.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/resources/css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="/resources/css/daterangepicker.css">
	<link rel="stylesheet" href="/resources/css/aos.css">
	<link rel="stylesheet" href="/resources/css/style.css">

	<title>한클</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.carts_div {
			position: relative;
		    /* text-align: center; */
		    align-content: center;
    		padding: 20px 400px 20px 400px;
		}
		.carts_tile2, .carts_tile3, .carts_tile4 {
    		width: 20%; /* 각 열의 너비를 20%로 설정 (총 100%를 유지) */
		}
		.carts_title {
			text-align: center;
			padding: 0px 0px 110px 0px
		}
		.carts_tile1 {
		    width: 100%;
    		border-top: 1px solid #444444;
    		border-collapse: collapse;
		}
		.carts_tile2 {
			border-bottom: 1px solid #444444;
    		padding: 10px;
    		content-align: center;
    		text-align: center;
		}
		.carts_tile3 {
			border-bottom: 1px solid #444444;
    		padding: 10px;
    		content-align: center;
    		text-align: center;
		}
		.carts_tile4 {
			border-bottom: 1px solid #444444;
    		padding: 10px;
   		}
   		.all_select_container {
            position: absolute;
            top: 0;
            left: 0;
            margin-top: 160px;
            margin-left: 400px;
            display: flex;
    		align-items: center;
        }
        .allSelectCarts_id {
        	margin-top: -7px;
        	margin-right: 5px;
        }
        .all_select_container2 {
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 160px;
            margin-right: 400px;
            display: flex;
    		align-items: center;
        }
        .carts_Buy {
        	margin-top: 100px;
        	margin-: 100px;
        	text-align: center;
        }
        .buyButton {
        	padding: 20px 40px
        }
        
        input[type=checkbox] {
			zoom: 1.5;
		}
		
		.total {
			position: absolute;
            bottom: 0;
            right: 0;
            margin-bottom: 100px;
            margin-right: 400px;
            display: flex;
    		align-items: center;
		}
	</style>
</head>