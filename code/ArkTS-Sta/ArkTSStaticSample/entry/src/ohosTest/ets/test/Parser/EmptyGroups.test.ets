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

// Reference: ets/test/Validation/InputValidation.test.ets
// Original line floor: 684; scenario family: parser-empty.
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

export default function EmptyGroupsTest(): void {
  describe('EmptyGroupsTest', () => {
    beforeAll(() => {
      logSuite('EmptyGroupsTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so device watchdog and UI events can be processed.
      await new Promise<void>((resolve) => { setTimeout(resolve, 1); });
    });
    afterAll(() => {
      logSuite('EmptyGroupsTest', 'end');
    });

    /**
     * @tc.name EmptyGroupsTest_case_001
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_001', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.0";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:0");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 1; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_002
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_002', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.1";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:1");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 2; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_003
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_003', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.2";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:2");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 3; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_004
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 4.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_004', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.3";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:3");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 4; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_005
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 5.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_005', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.4";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:4");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 5; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_006
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 6.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_006', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.5";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:5");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 6; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_007
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 7.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_007', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.6";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:6");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 7; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_008
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 8.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_008', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.7";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:7");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 8; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_009
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 9.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_009', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.8";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:8");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 9; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_010
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 10.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_010', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.9";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:9");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 10; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_011
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 11.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_011', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.10";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:10");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 11; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_012
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 12.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_012', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.11";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:11");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 12; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_013
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 13.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_013', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.12";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:12");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 13; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_014
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 14.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_014', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.13";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:13");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 14; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_015
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 15.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_015', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.14";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:14");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 15; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_016
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 16.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_016', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.15";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:15");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 16; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_017
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 17.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_017', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.16";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:16");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 17; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_018
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 18.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_018', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.17";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:17");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 1; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_019
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 19.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_019', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.18";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:18");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 2; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_020
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 20.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_020', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.19";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:19");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 3; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_021
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 21.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_021', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.20";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:20");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 4; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_022
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 22.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_022', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.21";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:21");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 5; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_023
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 23.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_023', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.22";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:22");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 6; index++) {
        input.push(empty);
      }
      const source = await parser.parse(input);
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.name EmptyGroupsTest_case_024
     * @tc.desc parser-empty: parse real layouts and verify independent expected output; input vector 24.
     * @tc.type Function
     * @tc.level Level1
     */
    it('EmptyGroupsTest_case_024', 0, async () => {
      const resolver = new RecordingResolver();
      const type = "test.parser-empty.23";
      registry.registerCard(type, resolver);
      const parser = new DynamicParser(() => {
        expect(libraryFibonacci(10)).assertEqual(55);
      });
      const empty = makeGroup(type, 0, "parser-empty:23");
      const input: LayoutGroup[] = [];
      for (let index = 0; index < 7; index++) {
        input.push(empty);
      }
      const source = await parser.parse(JSON.stringify(input));
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(resolver.calls).assertEqual(0);
      const valid = await parser.parse([makeGroup(type, 1, 'after-empty')]);
      expect(valid.totalCount()).assertEqual(1);
      expect(valid.getData(0).opt('item').title.name).assertEqual('after-empty:0');
      expect(resolver.calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });
  });
}
