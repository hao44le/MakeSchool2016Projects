//
//  Post.swift
//  Makestagram
//
//  Created by Chris Orcutt on 8/27/15.
//  Copyright © 2015 Make School. All rights reserved.
//

import Foundation
import Parse
import Bond
import ConvenienceKit

class Post : PFObject  {
  static var imageCache: NSCacheSwift<String, UIImage>!
  
  @NSManaged var imageFile: PFFile?
  @NSManaged var user: PFUser?
  
  var image: Observable<UIImage?> = Observable(nil)
  var likes: Observable<[PFUser]?> = Observable(nil)
  
  var photoUploadTask: UIBackgroundTaskIdentifier?
  
  override init() {
    super.init()
  }
  
  // MARK: Liking
  func fetchLikes() {
    // 1
    if (likes.value != nil) {
      return
    }
    
    // 2
    ParseHelper.likesForPost(self, completionBlock: { (var likes: [AnyObject]?, error: NSError?)  -> Void in
      // 3
      likes = likes?.filter { like in like[ParseHelper.ParseLikeFromUser] != nil }
      
      // 4
      self.likes.value = likes?.map { like in
        let like = like as! PFObject
        let fromUser = like[ParseHelper.ParseLikeFromUser] as! PFUser
        
        return fromUser
      }
    })
  }
  
  func toggleLikePost(user: PFUser) {
    if (doesUserLikePost(user)) {
      likes.value = likes.value?.filter { $0 != user }
      ParseHelper.unlikePost(user, post: self)
    } else {
      likes.value?.append(user)
      ParseHelper.likePost(user, post: self)
    }
  }
  
  func doesUserLikePost(user: PFUser) -> Bool {
    if let likes = likes.value {
      return likes.contains(user)
    } else {
      return false
    }
  }
  
  // MARK: Networking
  func uploadPost() {
    if let image = image.value {
      photoUploadTask = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler {
        () -> Void in
        UIApplication.sharedApplication().endBackgroundTask(self.photoUploadTask!)
      }
      
      let imageData = UIImageJPEGRepresentation(image, 0.8)
      let imageFile = PFFile(data: imageData!)
      imageFile.saveInBackgroundWithBlock(ErrorHandling.errorHandlingCallback)
      
      user = PFUser.currentUser()
      self.imageFile = imageFile
      saveInBackgroundWithBlock { (success, error) -> Void in
        UIApplication.sharedApplication().endBackgroundTask(self.photoUploadTask!)
      }
    }
  }
  
  func downloadImage() {
    // 1
    image.value = Post.imageCache[self.imageFile!.name]
    
    // if image is not downloaded yet, get it
    if (image.value == nil) {
      
      imageFile?.getDataInBackgroundWithBlock { (data: NSData?, error: NSError?) -> Void in
        if let data = data {
          let image = UIImage(data: data, scale:1.0)!
          self.image.value = image
          // 2
          Post.imageCache[self.imageFile!.name] = image
        }
      }
    }
  }
}

// MARK: PFSubclassing
extension Post: PFSubclassing {
  static func parseClassName() -> String {
    return "Post"
  }
  
  override class func initialize() {
    var onceToken : dispatch_once_t = 0;
    dispatch_once(&onceToken) {
      // inform Parse about this subclass
      self.registerSubclass()
      // 1
      Post.imageCache = NSCacheSwift<String, UIImage>()
    }
  }
}