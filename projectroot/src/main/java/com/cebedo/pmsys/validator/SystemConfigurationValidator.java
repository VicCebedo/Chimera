package com.cebedo.pmsys.validator;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.cebedo.pmsys.constants.RegistryErrorCodes;
import com.cebedo.pmsys.constants.RegistryResponseMessage;
import com.cebedo.pmsys.helper.ValidationHelper;
import com.cebedo.pmsys.model.SystemConfiguration;

@Component
public class SystemConfigurationValidator implements Validator {

    private ValidationHelper validationHelper = new ValidationHelper();

    @Override
    public boolean supports(Class<?> clazz) {
	return SystemConfiguration.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
	SystemConfiguration systemConfiguration = (SystemConfiguration) target;

	String name = systemConfiguration.getName();
	String value = systemConfiguration.getValue();

	if (!this.validationHelper.checkLength(name, 32)) {
	    this.validationHelper.rejectLength(errors, "name", 32);
	}
	if (!this.validationHelper.checkLength(value, 255)) {
	    this.validationHelper.rejectLength(errors, "value", 255);
	}
	// You cannot create a configuration with an empty name.
	if (StringUtils.isBlank(name)) {
	    errors.reject(RegistryErrorCodes.CONFIG_NAME,
		    RegistryResponseMessage.ERROR_CONFIG_EMPTY_NAME);
	}
    }

}
