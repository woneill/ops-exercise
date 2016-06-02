###Need to have
- [x] Chef cookbook[s], structure as you see fit.
- [x] Implement a Linux, MySQL, HHVM, Nginx single host running some sort of blog software (take your pick)
- [x] Base OS should be ubuntu 14.04
- [x] Use Berkshelf for dependancy management, please no vendor drops (but version locks are good!)
- [x] Should leverage community cookbooks when it make sense.
- [x] Shoud be testable using Vagrant.

###Nice to have
- [ ] Security hardening and user management.
- [ ] Should converge both in chef-zero and chef-client modes.
  - Converges in chef-zero but didn't have time to setup a chef-server to run chef-client against
- [ ] Take care with secrets!
- [x] Functional/Unit/Lint tests are cool.
  - Implemented functional tests via TestKitchen
  - The vagrant build does ServerSpec testing as a provisioning step
  - Purposely skipped unit tests since they're mostly repeating what's already in the code itself
- [x] Think in terms of re-usable components.
  - Seperated webserver from wordpress install. Could expand to make webserver cookbook flexible enough to generate site stubs instead of just disabling the default site
- [x] Bonus points for a rake/Thor file for common tasks.
