# Current test contract

See ../../../../../../ADAPTATION_REPORT.md and project-root REFERENCE_MAP.json for current coverage, mapping and limitations.

All 79 suites use real device APIs; no test-local domain model substitutes for production behavior.
All asynchronous operations are awaited; failed startup terminates the run with finishTest(-1).
UI operations share the retained serialized Driver queue.
