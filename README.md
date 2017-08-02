# AdobeSign

[![CI Status](http://img.shields.io/travis/elliott.bolzan@facebook.com/AdobeSign.svg?style=flat)](https://travis-ci.org/elliott.bolzan@facebook.com/AdobeSign)
[![Version](https://img.shields.io/cocoapods/v/AdobeSign.svg?style=flat)](http://cocoapods.org/pods/AdobeSign)
[![License](https://img.shields.io/cocoapods/l/AdobeSign.svg?style=flat)](http://cocoapods.org/pods/AdobeSign)
[![Platform](https://img.shields.io/cocoapods/p/AdobeSign.svg?style=flat)](http://cocoapods.org/pods/AdobeSign)

With a few lines of Swift, sign documents in legally-binding fashion using Adobe Sign. Here's [a short example ](https://www.youtube.com/watch?v=ekoOBUZrCQc)of what this framework can help you achieve.

## Requirements

- Adobe Sign credentials.
- iOS 9.0.
- Swift 3.

## Installation

AdobeSign is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AdobeSign"
```

## Usage

To make use of `AdobeSign` in your own iOS application, follow these two steps:

1. Add the `import AdobeSign` line to your `AppDelegate`.
2. Call the `configureAdobeSign` method from your `AppDelegate`'s `didFinishLaunchingWithOptions` method with the appropriate values.

All of the [AdobeSign REST API endpoints]((https://secure.na1.echosign.com/public/docs/restapi/v5)) can be accessed using the following model: `Sign.{service}.{endpoint}` (where `{service}` corresponds to `agreements`, `views`, etc.) 

### Login

```
Sign.login(completion: { success, error in
    guard success else {
        return
    }
    // your code
})
```

### Uploading a Transient Document

Assuming that `data` is of type `Data`, and that `fileName` is a `String` of the form `file.pdf`:

```
Sign.transientDocuments.create(data: data, fileName: fileName, mimeType: "application/pdf", completion: { result, error in
    guard let result = result, let transientDocumentId = result["transientDocumentId"] as? String else {
        return
    }
    // your code
})
```

### Creating an Agreement

Assuming that `parameters` is of type `[String: Any]`:

```
Sign.agreements.create(parameters: parameters, completion: { result, error in
    guard let result = result, let agreementId = result["agreementId"] as? String else {
        return
    }
    // your code
})
```

Additional samples are included in the Example project.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Then, replace the 4 instances of `<YOURS>` in `AppDelegate.swift` and the 1 instance in `AgreementViewController.swift` by the appropriate values.

Build and run, and you should be good to go!

## Author

Designed and developed by Elliott Bolzan.

## License

AdobeSign is available under the MIT license. See the LICENSE file for more info.
