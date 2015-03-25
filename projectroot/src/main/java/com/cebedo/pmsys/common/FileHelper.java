package com.cebedo.pmsys.common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.cebedo.pmsys.company.model.Company;

public class FileHelper {

	/**
	 * Upload a file.
	 * 
	 * @param file
	 * @param id
	 * @param objectName
	 * @throws IOException
	 */
	public void fileUpload(MultipartFile file, String fileLocation)
			throws IOException {
		// Prelims.
		byte[] bytes = file.getBytes();
		checkDirectoryExistence(fileLocation);

		// Upload file.
		FileOutputStream oStream = new FileOutputStream(new File(fileLocation));
		BufferedOutputStream stream = new BufferedOutputStream(oStream);
		stream.write(bytes);
		stream.close();
		oStream.close();
	}

	/**
	 * Helper function to create non-existing folders.
	 * 
	 * @param fileLocation
	 */
	public void checkDirectoryExistence(String fileLocation) {
		File file = new File(fileLocation);
		File parent = file.getParentFile();
		if (!parent.exists()) {
			parent.mkdirs();
		}
	}

	public void deletePhysicalFile(String location) {
		File phyFile = new File(location);
		phyFile.delete();
	}

	public String constructSysHomeFileURI(String sysHome, long companyID,
			String className, long objID, String moduleName, String fileName) {
		String companyClass = Company.class.getSimpleName().toLowerCase();

		String fileLocation = sysHome;
		fileLocation += "/" + companyClass + "/" + companyID;
		fileLocation += "/" + className.toLowerCase() + "/" + objID;
		fileLocation += "/" + moduleName.toLowerCase() + "/" + fileName;
		return fileLocation;
	}

}