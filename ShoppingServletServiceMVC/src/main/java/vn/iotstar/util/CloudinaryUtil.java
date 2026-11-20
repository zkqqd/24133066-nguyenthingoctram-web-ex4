package vn.iotstar.util;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

public class CloudinaryUtil {
    private static final Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "vzc2rr0w",
            "api_key", "431496228273759",
            "api_secret", "d-5g1KqLjpzEMPVo9OLG5BSnsU0",
            "secure", true
    ));

    public static String uploadImage(Part filePart) throws IOException {
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        try (InputStream is = filePart.getInputStream()) {
            byte[] bytes = is.readAllBytes();
            Map<?, ?> uploadResult = cloudinary.uploader().upload(bytes, ObjectUtils.asMap(
                    "folder", "shopping_mvc/avatars",
                    "resource_type", "image"
            ));
            return (String) uploadResult.get("secure_url");
        }
    }
}