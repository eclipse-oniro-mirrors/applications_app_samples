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
import { importDownloadFiles, writeDownloadMessage } from '../../../main/ets/model/DownloadFiles';
import { DownloadMatrixProbe } from './DownloadMatrixProbe';
import { logCase, logAssertion } from './EnvironmentTestSupport';

export default function downloadMatrix067Test(): void {
  describe('DownloadMatrix067', (): void => {
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001585
     * @tc.name EnvironmentSample_acceptedBoundary_1584
     * @tc.desc Accept hidden/dot-substrings boundaries, mask FFF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1584", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1584";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [".profile", "..suffix", "prefix.."];
        api.regularPaths = ["/download/.profile", "/download/..suffix", "/download/prefix.."];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = ["preexisting.txt", ".profile", "..suffix", "prefix.."];
        logAssertion(caseName, "result", result, expected01);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected01));
        const expected02: string[] = [
          "list:/download", "stat:/download/.profile", "copy:/download/.profile->/sandbox/.profile",
          "stat:/download/..suffix", "copy:/download/..suffix->/sandbox/..suffix", "stat:/download/prefix..",
          "copy:/download/prefix..->/sandbox/prefix..", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = [
          "/download/.profile->/sandbox/.profile", "/download/..suffix->/sandbox/..suffix",
          "/download/prefix..->/sandbox/prefix..",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", ".profile", "..suffix", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", ".profile", "..suffix", "prefix.."];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001586
     * @tc.name EnvironmentSample_acceptedBoundary_1585
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask DDD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1585", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1585";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected02: string[] =
          ["list:/download", "stat:/download/ 空白 ", "stat:/download/😀.txt", "stat:/download/x\ty", "list:/sandbox"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001587
     * @tc.name EnvironmentSample_acceptedBoundary_1586
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask DDF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1586", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1586";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/x\ty"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "x\ty"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "x\ty"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "stat:/download/😀.txt", "stat:/download/x\ty",
          "copy:/download/x\ty->/sandbox/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/x\ty->/sandbox/x\ty"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/x\ty->/sandbox/x\ty"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "x\ty"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "x\ty"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001588
     * @tc.name EnvironmentSample_acceptedBoundary_1587
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask DFD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1587", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1587";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/😀.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "😀.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "stat:/download/😀.txt", "copy:/download/😀.txt->/sandbox/😀.txt",
          "stat:/download/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/😀.txt->/sandbox/😀.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/😀.txt->/sandbox/😀.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "😀.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "😀.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001589
     * @tc.name EnvironmentSample_acceptedBoundary_1588
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask DFF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1588", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1588";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/😀.txt", "/download/x\ty"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "😀.txt", "x\ty"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt", "x\ty"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "stat:/download/😀.txt", "copy:/download/😀.txt->/sandbox/😀.txt",
          "stat:/download/x\ty", "copy:/download/x\ty->/sandbox/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/😀.txt->/sandbox/😀.txt", "/download/x\ty->/sandbox/x\ty"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "😀.txt", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt", "x\ty"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "😀.txt", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "😀.txt", "x\ty"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001590
     * @tc.name EnvironmentSample_acceptedBoundary_1589
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask FDD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1589", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1589";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/ 空白 "];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", " 空白 "]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 "]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "copy:/download/ 空白 ->/sandbox/ 空白 ", "stat:/download/😀.txt",
          "stat:/download/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/ 空白 ->/sandbox/ 空白 "]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/ 空白 ->/sandbox/ 空白 "]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 "]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 "]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 "]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001591
     * @tc.name EnvironmentSample_acceptedBoundary_1590
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask FDF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1590", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1590";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/ 空白 ", "/download/x\ty"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", " 空白 ", "x\ty"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "x\ty"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "copy:/download/ 空白 ->/sandbox/ 空白 ", "stat:/download/😀.txt",
          "stat:/download/x\ty", "copy:/download/x\ty->/sandbox/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/ 空白 ->/sandbox/ 空白 ", "/download/x\ty->/sandbox/x\ty"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 ", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "x\ty"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 ", "x\ty"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "x\ty"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001592
     * @tc.name EnvironmentSample_acceptedBoundary_1591
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask FFD; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1591", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1591";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/ 空白 ", "/download/😀.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", " 空白 ", "😀.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "😀.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "copy:/download/ 空白 ->/sandbox/ 空白 ", "stat:/download/😀.txt",
          "copy:/download/😀.txt->/sandbox/😀.txt", "stat:/download/x\ty", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/ 空白 ->/sandbox/ 空白 ", "/download/😀.txt->/sandbox/😀.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 ", "😀.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "😀.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", " 空白 ", "😀.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "😀.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001593
     * @tc.name EnvironmentSample_acceptedBoundary_1592
     * @tc.desc Accept whitespace/emoji/tab boundaries, mask FFF; stat in order, copy only files, list sandbox last
     * and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1592", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1592";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = [" 空白 ", "😀.txt", "x\ty"];
        api.regularPaths = ["/download/ 空白 ", "/download/😀.txt", "/download/x\ty"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", " 空白 ", "😀.txt", "x\ty"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", " 空白 ", "😀.txt", "x\ty"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/ 空白 ", "copy:/download/ 空白 ->/sandbox/ 空白 ", "stat:/download/😀.txt",
          "copy:/download/😀.txt->/sandbox/😀.txt", "stat:/download/x\ty", "copy:/download/x\ty->/sandbox/x\ty",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] =
          ["/download/ 空白 ->/sandbox/ 空白 ", "/download/😀.txt->/sandbox/😀.txt", "/download/x\ty->/sandbox/x\ty"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", " 空白 ", "😀.txt", "x\ty"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", " 空白 ", "😀.txt", "x\ty"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001594
     * @tc.name EnvironmentSample_acceptedBoundary_1593
     * @tc.desc Accept case/combining-Unicode boundaries, mask DDD; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1593", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1593";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "stat:/download/upper.txt", "stat:/download/é.txt",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, []);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify([]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001595
     * @tc.name EnvironmentSample_acceptedBoundary_1594
     * @tc.desc Accept case/combining-Unicode boundaries, mask DDF; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1594", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1594";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/é.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "é.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "é.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "stat:/download/upper.txt", "stat:/download/é.txt",
          "copy:/download/é.txt->/sandbox/é.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/é.txt->/sandbox/é.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/é.txt->/sandbox/é.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "é.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "é.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "é.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "é.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001596
     * @tc.name EnvironmentSample_acceptedBoundary_1595
     * @tc.desc Accept case/combining-Unicode boundaries, mask DFD; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1595", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1595";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/upper.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "upper.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "upper.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "stat:/download/upper.txt",
          "copy:/download/upper.txt->/sandbox/upper.txt", "stat:/download/é.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/upper.txt->/sandbox/upper.txt"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/upper.txt->/sandbox/upper.txt"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "upper.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "upper.txt"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "upper.txt"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "upper.txt"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001597
     * @tc.name EnvironmentSample_acceptedBoundary_1596
     * @tc.desc Accept case/combining-Unicode boundaries, mask DFF; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1596", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1596";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/upper.txt", "/download/é.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "upper.txt", "é.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "upper.txt", "é.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "stat:/download/upper.txt",
          "copy:/download/upper.txt->/sandbox/upper.txt", "stat:/download/é.txt",
          "copy:/download/é.txt->/sandbox/é.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/upper.txt->/sandbox/upper.txt", "/download/é.txt->/sandbox/é.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "upper.txt", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "upper.txt", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001598
     * @tc.name EnvironmentSample_acceptedBoundary_1597
     * @tc.desc Accept case/combining-Unicode boundaries, mask FDD; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1597", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1597";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/UPPER.TXT"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "UPPER.TXT"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "UPPER.TXT"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "copy:/download/UPPER.TXT->/sandbox/UPPER.TXT",
          "stat:/download/upper.txt", "stat:/download/é.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        logAssertion(caseName, "api.copied", api.copied, ["/download/UPPER.TXT->/sandbox/UPPER.TXT"]);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(["/download/UPPER.TXT->/sandbox/UPPER.TXT"]));
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "UPPER.TXT"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "UPPER.TXT"]));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, ["preexisting.txt", "UPPER.TXT"]);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(["preexisting.txt", "UPPER.TXT"]));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001599
     * @tc.name EnvironmentSample_acceptedBoundary_1598
     * @tc.desc Accept case/combining-Unicode boundaries, mask FDF; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1598", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1598";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/UPPER.TXT", "/download/é.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "UPPER.TXT", "é.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "UPPER.TXT", "é.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "copy:/download/UPPER.TXT->/sandbox/UPPER.TXT",
          "stat:/download/upper.txt", "stat:/download/é.txt", "copy:/download/é.txt->/sandbox/é.txt",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = ["/download/UPPER.TXT->/sandbox/UPPER.TXT", "/download/é.txt->/sandbox/é.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "UPPER.TXT", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "UPPER.TXT", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001600
     * @tc.name EnvironmentSample_acceptedBoundary_1599
     * @tc.desc Accept case/combining-Unicode boundaries, mask FFD; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1599", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1599";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/UPPER.TXT", "/download/upper.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        logAssertion(caseName, "result", result, ["preexisting.txt", "UPPER.TXT", "upper.txt"]);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(["preexisting.txt", "UPPER.TXT", "upper.txt"]));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "copy:/download/UPPER.TXT->/sandbox/UPPER.TXT",
          "stat:/download/upper.txt", "copy:/download/upper.txt->/sandbox/upper.txt", "stat:/download/é.txt",
          "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] =
          ["/download/UPPER.TXT->/sandbox/UPPER.TXT", "/download/upper.txt->/sandbox/upper.txt"];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "UPPER.TXT", "upper.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "UPPER.TXT", "upper.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001601
     * @tc.name EnvironmentSample_acceptedBoundary_1600
     * @tc.desc Accept case/combining-Unicode boundaries, mask FFF; stat in order, copy only files, list sandbox
     * last and isolate the returned result.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_acceptedBoundary_1600", 0, (): void => {
      const caseName: string = "EnvironmentSample_acceptedBoundary_1600";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.entries = ["UPPER.TXT", "upper.txt", "é.txt"];
        api.regularPaths = ["/download/UPPER.TXT", "/download/upper.txt", "/download/é.txt"];
        const result: string[] = importDownloadFiles('/download', '/sandbox', api);
        const expected01: string[] = ["preexisting.txt", "UPPER.TXT", "upper.txt", "é.txt"];
        logAssertion(caseName, "result", result, expected01);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected01));
        const expected02: string[] = [
          "list:/download", "stat:/download/UPPER.TXT", "copy:/download/UPPER.TXT->/sandbox/UPPER.TXT",
          "stat:/download/upper.txt", "copy:/download/upper.txt->/sandbox/upper.txt", "stat:/download/é.txt",
          "copy:/download/é.txt->/sandbox/é.txt", "list:/sandbox",
        ];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        const expected03: string[] = [
          "/download/UPPER.TXT->/sandbox/UPPER.TXT", "/download/upper.txt->/sandbox/upper.txt",
          "/download/é.txt->/sandbox/é.txt",
        ];
        logAssertion(caseName, "api.copied", api.copied, expected03);
        expect(JSON.stringify(api.copied)).assertEqual(JSON.stringify(expected03));
        const expected04: string[] = ["preexisting.txt", "UPPER.TXT", "upper.txt", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected04);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected04));
        logAssertion(caseName, "result === api.sandboxEntries", result === api.sandboxEntries, false);
        expect(result === api.sandboxEntries).assertEqual(false);
        result.push('caller-only');
        const expected06: string[] = ["preexisting.txt", "UPPER.TXT", "upper.txt", "é.txt"];
        logAssertion(caseName, "api.sandboxEntries", api.sandboxEntries, expected06);
        expect(JSON.stringify(api.sandboxEntries)).assertEqual(JSON.stringify(expected06));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001602
     * @tc.name EnvironmentSample_writer_0_success_1601
     * @tc.desc Write empty payload, descriptor 0, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1601", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1601";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001603
     * @tc.name EnvironmentSample_writer_0_write_1602
     * @tc.desc Write empty payload, descriptor 0, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1602", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1602";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001604
     * @tc.name EnvironmentSample_writer_0_close_1603
     * @tc.desc Write empty payload, descriptor 0, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1603", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1603";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001605
     * @tc.name EnvironmentSample_writer_0_both_1604
     * @tc.desc Write empty payload, descriptor 0, mode both; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_both_1604", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_both_1604";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        const closeError: Error = new Error("close failed");
        api.writeFailure = writeError;
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] =
          ["open:/download/temp.txt", "write:0:", "close:0", "open:/download/temp.txt", "write:0:retry", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001606
     * @tc.name EnvironmentSample_writer_0_success_1605
     * @tc.desc Write plain payload, descriptor 0, mode success; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_success_1605", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_success_1605";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === undefined", caught === undefined, true);
        expect(caught === undefined).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:plain text", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:plain text", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001607
     * @tc.name EnvironmentSample_writer_0_write_1606
     * @tc.desc Write plain payload, descriptor 0, mode write; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_write_1606", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_write_1606";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const writeError: Error = new Error("write failed");
        api.writeFailure = writeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === writeError", caught === writeError, true);
        expect(caught === writeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:plain text", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.writeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:plain text", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_ENVIRONMENT_MATRIX_001608
     * @tc.name EnvironmentSample_writer_0_close_1607
     * @tc.desc Write plain payload, descriptor 0, mode close; open/write/finally-close once, preserve last error
     * identity, clear failures and retry.
     * @tc.type FUNC
     * @tc.level Level 1
     */
    it("EnvironmentSample_writer_0_close_1607", 0, (): void => {
      const caseName: string = "EnvironmentSample_writer_0_close_1607";
      logCase(caseName, 'begin');
      try {
        const api: DownloadMatrixProbe = new DownloadMatrixProbe();
        api.descriptor = 0;
        const closeError: Error = new Error("close failed");
        api.closeFailure = closeError;
        let caught: Error | undefined = undefined;
        try {
          writeDownloadMessage("/download", "plain text", api);
        } catch (error) {
          caught = error as Error;
        }
        logAssertion(caseName, "caught === closeError", caught === closeError, true);
        expect(caught === closeError).assertEqual(true);
        const expected02: string[] = ["open:/download/temp.txt", "write:0:plain text", "close:0"];
        logAssertion(caseName, "api.events", api.events, expected02);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected02));
        api.closeFailure = undefined;
        writeDownloadMessage("/download", "retry", api);
        const expected03: string[] = [
          "open:/download/temp.txt", "write:0:plain text", "close:0", "open:/download/temp.txt", "write:0:retry",
          "close:0",
        ];
        logAssertion(caseName, "api.events", api.events, expected03);
        expect(JSON.stringify(api.events)).assertEqual(JSON.stringify(expected03));
      } finally {
        logCase(caseName, 'end');
      }
    });
  });
}
