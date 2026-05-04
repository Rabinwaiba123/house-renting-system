package util;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Part;

public class ImageUtil {

	public static String uploadImage(Part part, ServletContext context, String folderName) throws IOException {

		if (part == null || part.getSize() == 0) {
			return null;
		}

		String originalFileName = part.getSubmittedFileName();

		if (originalFileName == null || originalFileName.trim().isEmpty()) {
			return null;
		}

		String fileName = System.currentTimeMillis() + "_" + originalFileName;

		String uploadPath = context.getRealPath("") + File.separator + folderName;

		File uploadFolder = new File(uploadPath);

		if (!uploadFolder.exists()) {
			uploadFolder.mkdir();
		}

		part.write(uploadPath + File.separator + fileName);

		return folderName + "/" + fileName;
	}
}