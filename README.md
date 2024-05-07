# TapiSDK

  The TapiSDK for iOS is a wrapper around the Terminal API for payment processing for legacy Fivestars integrators including loyalty with cPay.

## Features
- DocC documentation available [here](docs)

## Integration

The TapiSDK can be integrated using Swift Package Manager or through CocoaPods.

# Swift Package Manager (SPM)
```
.package(url: "https://github.com/fivestars/tapi-sdk-ios-distribution", from: "0.0.1"),
```

# Cocoapod
```
pod 'TapiSDK', :git => 'https://github.com/fivestars/tapi-sdk-ios-distribution', :tag => '0.0.3'
```

## Requirments
- Xcode 13 or later
- Deployment target iOS 13 or later

## Documentation
As mentioned prior, the main documentation is distributed with this repo via a DocC Archive and can be found [here](docs).

## Usage
```
// A normal implementation to process a transaction through `TapiSDK` would be as follows.
// After conforming to the `TapiDelegate` protocol and implementing the required delegate methods.


// Step 1: Initialize a `TapiManager` with an appropriate `TapiConfiguration`
let configuration = TapiConfiguration(environment: environment,
                                      softwareID: softwareID,
                                      apiKey: apiKey,
                                      apiSecret: apiSecret,
                                      terminalID: terminalID,
                                      posID: posID,
                                      skipOptions: skipOptions)
let tapiManager = TapiManager(configuration, delegate: self)

// Step 2: Listen for `TapiEvent`s to be sent back via the delegate method and take action appropriately.
func tapiManager(_ tapiManager: TapiSDK.TapiManager, didSendEvent event: TapiSDK.TapiEvent) { }

// Step 2a: Send any necessary `TapiAction`s as needed to the cPay device or perform a refund through the `refund` method.
 tapiManager.sendAction(.toggleScreensaver(true)) // Turns the screensaver on.
 tapiManager.sendAction(.toggleScreensaver(false)) // Turns the screensaver off.

// Step 3: Initiate a checkout request through the `checkout` method of the `TapiManager`
tapiManager.checkout(order,
                     transactionType: transactionType)

// Step 3a: Send commands such as `cancelCurrentCheckout` or `changePaymentType` as needed.
tapiManager.cancelCurrentTransaction()

// Step 4: Issue a `resetSession` command upon exiting the POS register screen, etc. Possibly only initializing the object when the cashier is in the actual checkout screens of the POS app.
tapiManager.resetSession()
```