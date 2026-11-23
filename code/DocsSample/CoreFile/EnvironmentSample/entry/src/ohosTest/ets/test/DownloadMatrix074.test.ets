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

import { describe, it, expect } from '@ohos/hypium';
import { importDownloadFiles } from '../../../main/ets/model/DownloadFiles';
import { DownloadMatrixProbe } from './DownloadMatrixProbe';
import { logCase, logAssertion } from './EnvironmentTestSupport';

export default function downloadMatrix074Test(): void {
  describe('DownloadMatrix074', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001753
     * @tc.name EnvironmentSample_scheduledIndependent_1752
     * @tc.desc Schedule a/b imports, mask DD, dispatch BA, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1752", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1752";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        logAssertion(caseName, "results", results, [["preexisting.txt"], ["preexisting.txt"]]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([["preexisting.txt"], ["preexisting.txt"]]));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt", "list:/a-sandbox"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001754
     * @tc.name EnvironmentSample_scheduledIndependent_1753
     * @tc.desc Schedule a/b imports, mask DF, dispatch AB, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1753", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1753";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        const expected02: string[][] = [["preexisting.txt"], ["preexisting.txt", "b.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt", "list:/a-sandbox"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001755
     * @tc.name EnvironmentSample_scheduledIndependent_1754
     * @tc.desc Schedule a/b imports, mask DF, dispatch BA, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1754", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1754";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        const expected02: string[][] = [["preexisting.txt", "b.txt"], ["preexisting.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt", "list:/a-sandbox"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001756
     * @tc.name EnvironmentSample_scheduledIndependent_1755
     * @tc.desc Schedule a/b imports, mask FD, dispatch AB, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1755", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1755";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        const expected02: string[][] = [["preexisting.txt", "a.txt"], ["preexisting.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = [
          "list:/a-download", "stat:/a-download/a.txt", "copy:/a-download/a.txt->/a-sandbox/a.txt",
          "list:/a-sandbox",
        ];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, ["/a-download/a.txt->/a-sandbox/a.txt"]);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify(["/a-download/a.txt->/a-sandbox/a.txt"]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt", "a.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001757
     * @tc.name EnvironmentSample_scheduledIndependent_1756
     * @tc.desc Schedule a/b imports, mask FD, dispatch AB, first stat failure True; verify dispatch, fixed results,
     * error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1756", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1756";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        first.faultEvent = "stat:/a-download/a.txt";
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        logAssertion(caseName, "results", results, [[], ["preexisting.txt"]]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([[], ["preexisting.txt"]]));
        logAssertion(caseName, "firstError === first.failure", firstError === first.failure, true);
        expect(firstError === first.failure).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001758
     * @tc.name EnvironmentSample_scheduledIndependent_1757
     * @tc.desc Schedule a/b imports, mask FD, dispatch BA, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1757", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1757";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        const expected02: string[][] = [["preexisting.txt"], ["preexisting.txt", "a.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = [
          "list:/a-download", "stat:/a-download/a.txt", "copy:/a-download/a.txt->/a-sandbox/a.txt",
          "list:/a-sandbox",
        ];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, ["/a-download/a.txt->/a-sandbox/a.txt"]);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify(["/a-download/a.txt->/a-sandbox/a.txt"]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt", "a.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001759
     * @tc.name EnvironmentSample_scheduledIndependent_1758
     * @tc.desc Schedule a/b imports, mask FD, dispatch BA, first stat failure True; verify dispatch, fixed results,
     * error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1758", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1758";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        first.faultEvent = "stat:/a-download/a.txt";
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        logAssertion(caseName, "results", results, [["preexisting.txt"], []]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([["preexisting.txt"], []]));
        logAssertion(caseName, "firstError === first.failure", firstError === first.failure, true);
        expect(firstError === first.failure).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = ["list:/b-download", "stat:/b-download/b.txt", "list:/b-sandbox"];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, []);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001760
     * @tc.name EnvironmentSample_scheduledIndependent_1759
     * @tc.desc Schedule a/b imports, mask FF, dispatch AB, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1759", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1759";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        const expected02: string[][] = [["preexisting.txt", "a.txt"], ["preexisting.txt", "b.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = [
          "list:/a-download", "stat:/a-download/a.txt", "copy:/a-download/a.txt->/a-sandbox/a.txt",
          "list:/a-sandbox",
        ];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, ["/a-download/a.txt->/a-sandbox/a.txt"]);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify(["/a-download/a.txt->/a-sandbox/a.txt"]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt", "a.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001761
     * @tc.name EnvironmentSample_scheduledIndependent_1760
     * @tc.desc Schedule a/b imports, mask FF, dispatch AB, first stat failure True; verify dispatch, fixed results,
     * error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1760", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1760";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        first.faultEvent = "stat:/a-download/a.txt";
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runFirst));
        pending.push(Promise.resolve().then(runSecond));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["first", "second"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["first", "second"]));
        logAssertion(caseName, "results", results, [[], ["preexisting.txt", "b.txt"]]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([[], ["preexisting.txt", "b.txt"]]));
        logAssertion(caseName, "firstError === first.failure", firstError === first.failure, true);
        expect(firstError === first.failure).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001762
     * @tc.name EnvironmentSample_scheduledIndependent_1761
     * @tc.desc Schedule a/b imports, mask FF, dispatch BA, first stat failure False; verify dispatch, fixed
     * results, error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1761", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1761";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        const expected02: string[][] = [["preexisting.txt", "b.txt"], ["preexisting.txt", "a.txt"]];
        logAssertion(caseName, "results", results, expected02);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "firstError === undefined", firstError === undefined, true);
        expect(firstError === undefined).assertEqual(true);
        const expected04: string[] = [
          "list:/a-download", "stat:/a-download/a.txt", "copy:/a-download/a.txt->/a-sandbox/a.txt",
          "list:/a-sandbox",
        ];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, ["/a-download/a.txt->/a-sandbox/a.txt"]);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify(["/a-download/a.txt->/a-sandbox/a.txt"]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt", "a.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "a.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001763
     * @tc.name EnvironmentSample_scheduledIndependent_1762
     * @tc.desc Schedule a/b imports, mask FF, dispatch BA, first stat failure True; verify dispatch, fixed results,
     * error identity and API isolation.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_scheduledIndependent_1762", 0, async (): Promise<void> => {
      const caseName: string = "EnvironmentSample_scheduledIndependent_1762";
      logCase(caseName, 'begin');
      try {
        const first: DownloadMatrixProbe = new DownloadMatrixProbe();
        first.downloadPath = "/a-download";
        first.sandboxPath = "/a-sandbox";
        first.entries = ["a.txt"];
        first.regularPaths = ["/a-download/a.txt"];
        const second: DownloadMatrixProbe = new DownloadMatrixProbe();
        second.downloadPath = "/b-download";
        second.sandboxPath = "/b-sandbox";
        second.entries = ["b.txt"];
        second.regularPaths = ["/b-download/b.txt"];
        first.faultEvent = "stat:/a-download/a.txt";
        const order: string[] = [];
        let firstError: Error | undefined = undefined;
        const runFirst: () => string[] = (): string[] => {
          order.push("first");
          try {
            return importDownloadFiles("/a-download", "/a-sandbox", first);
          } catch (error) {
            firstError = error as Error;
            return [];
          }
        };
        const runSecond: () => string[] = (): string[] => {
          order.push("second");
          return importDownloadFiles("/b-download", "/b-sandbox", second);
        };
        const pending: Promise<string[]>[] = [];
        pending.push(Promise.resolve().then(runSecond));
        pending.push(Promise.resolve().then(runFirst));
        const results: string[][] = await Promise.all(pending);
        logAssertion(caseName, "order", order, ["second", "first"]);
        expect(JSON.stringify(order)).assertEqual(JSON.stringify(["second", "first"]));
        logAssertion(caseName, "results", results, [["preexisting.txt", "b.txt"], []]);
        expect(JSON.stringify(results)).assertEqual(JSON.stringify([["preexisting.txt", "b.txt"], []]));
        logAssertion(caseName, "firstError === first.failure", firstError === first.failure, true);
        expect(firstError === first.failure).assertEqual(true);
        const expected04: string[] = ["list:/a-download", "stat:/a-download/a.txt"];
        logAssertion(caseName, "first.events", first.events, expected04);
        expect(JSON.stringify(first.events)).assertEqual(JSON.stringify(expected04));
        const expected05: string[] = [
          "list:/b-download", "stat:/b-download/b.txt", "copy:/b-download/b.txt->/b-sandbox/b.txt",
          "list:/b-sandbox",
        ];
        logAssertion(caseName, "second.events", second.events, expected05);
        expect(JSON.stringify(second.events)).assertEqual(JSON.stringify(expected05));
        logAssertion(caseName, "first.copied", first.copied, []);
        expect(JSON.stringify(first.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "second.copied", second.copied, ["/b-download/b.txt->/b-sandbox/b.txt"]);
        expect(JSON.stringify(second.copied)).assertEqual(JSON.stringify(["/b-download/b.txt->/b-sandbox/b.txt"]));
        logAssertion(caseName, "first.sandboxEntries", first.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(first.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "second.sandboxEntries", second.sandboxEntries, ["preexisting.txt", "b.txt"]);
        expect(JSON.stringify(second.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "b.txt"]));
        logAssertion(caseName, "results[0] === results[1]", results[0] === results[1], false);
        expect(results[0] === results[1]).assertEqual(false);
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
