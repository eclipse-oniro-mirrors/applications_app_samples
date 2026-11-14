/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// Reference: ets/test/LifecycleState/ExceptionHandling.test.ets
// Original line floor: 1024; scenario family: parser-invalid.
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataModel } from 'library/src/main/ets/components/dyn/DataModel';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { DataParser as DynamicParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { EtsFactory } from 'library/src/main/ets/components/sta_bridge/EtsFactory';
import { fibonacciRecursive as libraryFibonacci } from 'library/src/main/ets/components/dyn/Workload';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { fibonacciRecursive as entryFibonacci } from '../../../../main/ets/pages/Workload';
import bundledLayout from '../../../../main/ets/pages/jsonData.json';
import {
  CardPayload, CardStyle, LayoutGroup, makePayload, makeModel, makeGroup, makeSource,
  assertSource, assertUniqueIds, snapshotTitles, RecordingResolver, ListenerRecorder,
  ControlledParser, ControlledFactory, waitForNativeFactory, logSuite, expectedFibonacci
} from '../Shared/ScenarioSupport';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function InvalidJsonTest(): void {
  describe('InvalidJsonTest', () => {
    beforeAll(() => {
      logSuite('InvalidJsonTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('InvalidJsonTest', 'end');
    });

    /**
     * @tc.name InvalidJsonTest_case_001
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:0");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:0");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_002
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = " ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:1");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:1");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_003
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:2");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:2");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_004
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:3");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:3");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_005
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "undefined";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:4");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:4");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_006
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"type\":}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:5");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:5");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_007
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[1,]";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:6");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:6");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_008
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"a\":1,}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:7");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:7");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_009
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{unquoted:1}";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:8");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:8");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_010
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "null trailing";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:9");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:9");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_011
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "\"unterminated";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:10");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:10");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_012
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "NaN";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:11");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:11");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_013
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = " ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:12");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:12");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_014
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:13");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:13");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_015
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{ ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:14");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:14");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_016
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[ ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:15");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:15");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_017
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "undefined ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:16");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:16");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_018
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"type\":} ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:17");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:17");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_019
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[1,] ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:18");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:18");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_020
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"a\":1,} ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:19");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:19");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_021
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{unquoted:1} ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:20");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:20");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_022
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "null trailing ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:21");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:21");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_023
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "\"unterminated ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:22");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:22");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_024
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "NaN ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:23");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:23");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_025
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_025', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.24";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:24");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:24");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_026
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_026', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.25";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "   ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:25");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:25");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_027
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_027', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.26";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:26");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:26");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_028
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_028', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.27";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:27");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:27");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_029
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_029', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.28";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "undefined  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:28");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:28");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_030
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_030', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.29";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"type\":}  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 5, "parser-invalid:29");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-invalid:29");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_031
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_031', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.30";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "[1,]  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 1, "parser-invalid:30");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-invalid:30");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_032
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_032', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.31";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{\"a\":1,}  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 2, "parser-invalid:31");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-invalid:31");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_033
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_033', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.32";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "{unquoted:1}  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 3, "parser-invalid:32");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-invalid:32");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name InvalidJsonTest_case_034
     * @tc.desc parser-invalid: parse real layouts and verify independent expected output; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('InvalidJsonTest_case_034', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-invalid.33";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const invalid = "null trailing  ";
      let caught = false;
      try {
        await parser.parse(invalid);
      } catch (error) {
        caught = true;
        expect(error instanceof SyntaxError).assertTrue();
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(0);
      const valid = makeGroup(type, 4, "parser-invalid:33");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-invalid:33");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });
  });
}
