/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
/**
* Yields the JS thread back to the event loop.
*
* The test runner executes a long queue of specs on the UI thread. On a device
* with a six second thread block watchdog, an unbroken run of specs can be
* mistaken for a frozen application and the process is killed. Every suite
* awaits this helper once in beforeAll, which hands the loop back between
* suites and keeps each busy window short.
*/
export function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 20);
  });
}
