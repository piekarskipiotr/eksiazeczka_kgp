enum PeakChipStateStatus {
  initial,
  validatingMemorablePhoto,
  addingGalleryPhotoPermissionsPermanentlyDenied,
  validatingMemorablePhotoCanceled,
  validatingMemorablePhotoSucceeded,
  validatingMemorablePhotoFailed,
  savingMemorablePhoto,
  savingMemorablePhotoSucceeded,
  savingMemorablePhotoFailed,
  insertingMetadata,
  insertingMetadataSucceeded,
  insertingMetadataFailed;
}
