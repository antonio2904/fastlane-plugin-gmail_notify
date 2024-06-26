# gmail_notify plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-gmail_notify)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-gmail_notify`, add it to your project by running:

```bash
fastlane add_plugin gmail_notify
```

## About gmail_notify

Sends a mail using SMTP

`gmail_notify` allows you to send a gmail using smtp so that you can notify the team about a new release.

## Usage

To get started you must have a gmail and [app password](https://knowledge.workspace.google.com/kb/how-to-generate-an-app-passwords-000009237) generated.

```ruby
gmail_notify(
  smtp_email: "<sender email>",
  smtp_password: "<app password>",
  recipients: "<recipients comma separated>",
  cc: "<cc>",
  subject: "<gmail subject>",
  template_file: "<path to mail template>",
  lint_report: "<path to lint report html file>",
  placeholders: {
    var1: "world"
  }
)
```

The mail body is constructed using a [html template](template.html) file. The value for variables in the template file can be provided in the placeholder hash.

### Parameters

| Key | Description |
|-----------------|--------------------|
| `smtp_email` | Email account for smtp authentication (Sender's email) |
| `smtp_password` | Password for smtp authentication |
| `recipients` | Comma separated list of recipients |
| `cc` | Comma separated list of cc |
| `subject` | Email subject |
| `template_file` | Path to template file |
| `lint_report` | Path to lint report html file |
| `placeholders` | Hash that contains value of variables in the template |


## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
