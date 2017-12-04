<?php namespace Opensmarty\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Opensmarty\Models\Image\OpensmartyImage;
use Opensmarty\Http\Controllers\BaseController;
use Opensmarty\Image\Controllers\OpensmartyImageController;
use Opensmarty\Models\Image\OpensmartyImage;
use Opensmarty\Image\OpensmartyImageService;

class ImageController extends BaseController
{

    public function postImage(Request $request)
    {
        $opensmartyImageService = new OpensmartyImageService();
        $file = $request->file('image');

        $opensmartyImage = null;
        try {
            /** @var OpensmartyImage $opensmartyImage */
            $opensmartyImage = $ImageService->handleUploadedFile($file);
        } catch (Exception $e) {
            return response('Failed to save: ' . $e->getMessage(), 422);
        }

        if (!$opensmartyImage) {
            return response('Failed to save uploaded image.', 422);
        }

        $opensmartyImageId = $opensmartyImage->getOpensmartyImageId();
        return response([
            'data' => [
                'opensmarty_image_id' => $opensmartyImage->getOpensmartyImageId(),
                'opensmarty_image_url' => $opensmartyImage->getImageUrl(),
                'thumbnail_image_url' => $opensmartyImage->getTypeImageUrl('thumbnail'),
            ]
        ]);
    }

    public function showOriginalImage($image_name)
    {
        return OpensmartyImageController::showImage('original', $image_name);
    }

    public function showTypeImage($type, $image_name)
    {
        return OpensmartyImageController::showImage($type, $image_name);
    }

}