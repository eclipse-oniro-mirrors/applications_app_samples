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

// Reference: ets/test/LifecycleState/ErrorRecovery.test.ets
// Original line floor: 1041; scenario family: parser-recovery.
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

export default function ErrorRecoveryTest(): void {
  describe('ErrorRecoveryTest', () => {
    beforeAll(() => {
      logSuite('ErrorRecoveryTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('ErrorRecoveryTest', 'end');
    });

    /**
     * @tc.name ErrorRecoveryTest_case_001
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.0";
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
      const valid = makeGroup(type, 1, "parser-recovery:0");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:0");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_002
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.1";
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
      const valid = makeGroup(type, 2, "parser-recovery:1");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:1");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_003
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.2";
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
      const valid = makeGroup(type, 3, "parser-recovery:2");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:2");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_004
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.3";
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
      const valid = makeGroup(type, 4, "parser-recovery:3");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:3");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_005
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.4";
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
      const valid = makeGroup(type, 5, "parser-recovery:4");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:4");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_006
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.5";
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
      const valid = makeGroup(type, 1, "parser-recovery:5");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:5");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_007
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.6";
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
      const valid = makeGroup(type, 2, "parser-recovery:6");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:6");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_008
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.7";
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
      const valid = makeGroup(type, 3, "parser-recovery:7");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:7");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_009
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.8";
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
      const valid = makeGroup(type, 4, "parser-recovery:8");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:8");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_010
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.9";
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
      const valid = makeGroup(type, 5, "parser-recovery:9");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:9");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_011
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.10";
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
      const valid = makeGroup(type, 1, "parser-recovery:10");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:10");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_012
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.11";
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
      const valid = makeGroup(type, 2, "parser-recovery:11");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:11");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_013
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.12";
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
      const valid = makeGroup(type, 3, "parser-recovery:12");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:12");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_014
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.13";
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
      const valid = makeGroup(type, 4, "parser-recovery:13");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:13");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_015
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.14";
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
      const valid = makeGroup(type, 5, "parser-recovery:14");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:14");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_016
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.15";
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
      const valid = makeGroup(type, 1, "parser-recovery:15");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:15");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_017
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.16";
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
      const valid = makeGroup(type, 2, "parser-recovery:16");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:16");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_018
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.17";
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
      const valid = makeGroup(type, 3, "parser-recovery:17");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:17");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_019
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.18";
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
      const valid = makeGroup(type, 4, "parser-recovery:18");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:18");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_020
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.19";
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
      const valid = makeGroup(type, 5, "parser-recovery:19");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:19");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_021
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.20";
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
      const valid = makeGroup(type, 1, "parser-recovery:20");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:20");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_022
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.21";
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
      const valid = makeGroup(type, 2, "parser-recovery:21");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:21");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_023
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.22";
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
      const valid = makeGroup(type, 3, "parser-recovery:22");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:22");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_024
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.23";
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
      const valid = makeGroup(type, 4, "parser-recovery:23");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:23");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_025
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 25.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_025', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.24";
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
      const valid = makeGroup(type, 5, "parser-recovery:24");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:24");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_026
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 26.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_026', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.25";
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
      const valid = makeGroup(type, 1, "parser-recovery:25");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:25");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_027
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 27.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_027', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.26";
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
      const valid = makeGroup(type, 2, "parser-recovery:26");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:26");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_028
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 28.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_028', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.27";
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
      const valid = makeGroup(type, 3, "parser-recovery:27");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:27");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_029
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 29.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_029', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.28";
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
      const valid = makeGroup(type, 4, "parser-recovery:28");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:28");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_030
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 30.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_030', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.29";
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
      const valid = makeGroup(type, 5, "parser-recovery:29");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 5, "parser-recovery:29");
      expect(resolver.calls).assertEqual(5);
      expect(resolver.models.length).assertEqual(5);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_031
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 31.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_031', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.30";
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
      const valid = makeGroup(type, 1, "parser-recovery:30");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 1, "parser-recovery:30");
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models.length).assertEqual(1);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_032
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 32.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_032', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.31";
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
      const valid = makeGroup(type, 2, "parser-recovery:31");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 2, "parser-recovery:31");
      expect(resolver.calls).assertEqual(2);
      expect(resolver.models.length).assertEqual(2);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_033
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 33.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_033', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.32";
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
      const valid = makeGroup(type, 3, "parser-recovery:32");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 3, "parser-recovery:32");
      expect(resolver.calls).assertEqual(3);
      expect(resolver.models.length).assertEqual(3);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });

    /**
     * @tc.name ErrorRecoveryTest_case_034
     * @tc.desc parser-recovery: parse real layouts and verify independent expected output; input vector 34.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ErrorRecoveryTest_case_034', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-recovery.33";
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
      const valid = makeGroup(type, 4, "parser-recovery:33");
      const recovered = await parser.parse([valid]);
      await assertSource(recovered, type, 4, "parser-recovery:33");
      expect(resolver.calls).assertEqual(4);
      expect(resolver.models.length).assertEqual(4);
      expect(recovered.getData(0).data === valid.data[0]).assertTrue();
    });
  });
}
