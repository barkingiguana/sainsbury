# Sainsburys

DevOps test for Sainsburys.

The task set can be found in [task.docx](https://github.com/barkingiguana/sainsburys/blob/master/task.docx).

## Assumptions

I assume that you've got a recent Chef Development Kit and VirtualBox install.

## Running the solution

```bash
./doit.sh
```

## Testing

There are a few simple serverspec tests managed via Kitchen. They're not
terribly thorough, but they are just about enough to show my approach in the
context of this test. You can run them with kitchen like this:

```bash
kitchen test
```

## Notes

I'd prefer to use Docker and some sort of gossip based network discovery so
that if an app node is added or removed the load balanced pool is very
quickly updated, but that is beyond the scope of this exercise.

The exercise offers bonus points for automating build and delivery of updated
code to the environment. My approach using Chef would be to create a native
package and a local package repository and ensure that the latest version of
this package was installed on all the app servers in the app recipe. Even
this approach is quite naive however and does not cover the complexities of
online database migrations, zero downtime deployments, or reduced risk
deployments. I'd reach for a canary deployment or a blue/green deployment
for these cases. However, I felt that this was beyond what was being asked
for in the test.
