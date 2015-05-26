package com.cebedo.pmsys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cebedo.pmsys.constants.SystemConstants;

@Controller
@RequestMapping(SystemConstants.REQUEST_ROOT)
public class MainController {

	private static final String JSP_HOME = "home";

	@RequestMapping(value = { SystemConstants.REQUEST_ROOT })
	public String view() {
		return SystemConstants.SYSTEM + "/" + JSP_HOME;
	}
}