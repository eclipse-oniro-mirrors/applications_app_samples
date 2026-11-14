/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { CardData } from 'library/src/main/ets/components/dyn/CardData';
import { DataSource } from 'library/src/main/ets/components/dyn/DataSource';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { makeGroup, makePayload, RecordingResolver, snapshotTitles } from '../Shared/ScenarioSupport';
import { CallbackResolver, expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function executionBoundaryTest(): void {
  describe('ExecutionBoundaryTest', () => {
    beforeEach(yieldBetweenCases);

    it('ExecutionBoundaryTest_workloadPrecedesEveryResolver', 0, async () => {
      const type = 'boundary.execution.order';
      const events: string[] = [];
      const resolver = new CallbackResolver((model, index) => {
        events.push('resolve:' + index);
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const parser = new DataParser(() => { events.push('workload'); });
      const pending = parser.parse([makeGroup(type, 2, 'order')]);
      events.push('returned');
      expect(events).assertDeepEquals(['workload', 'resolve:0', 'resolve:1', 'returned']);
      const source = await pending;
      expect(snapshotTitles(source)).assertDeepEquals(['order:0', 'order:1']);
    });

    it('ExecutionBoundaryTest_invalidJsonDoesNotInvokeWorkload', 0, () => {
      let calls = 0;
      const parser = new DataParser(() => { calls++; });
      let caught = false;
      try {
        parser.parse('[broken');
      } catch (error) {
        caught = error instanceof SyntaxError;
      }
      expect(caught).assertTrue();
      expect(calls).assertEqual(0);
    });

    it('ExecutionBoundaryTest_workloadFailureStopsBeforeMutation', 0, () => {
      const type = 'boundary.execution.workload-failure';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const input = makeGroup(type, 1, 'untouched');
      const failure = new Error('workload failed');
      const parser = new DataParser(() => { throw failure; });
      expectSyncFailure(() => { parser.parse([input]); }, failure);
      expect(resolver.calls).assertEqual(0);
      expect(input.data[0].style.width).assertEqual('100%');
      expect(inspectProperty(input.data[0].style, 'width').hasGetter).assertFalse();
    });

    it('ExecutionBoundaryTest_sameParserRecoversFromWorkloadFailure', 0, async () => {
      const type = 'boundary.execution.workload-retry';
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const failure = new Error('first workload failed');
      let attempts = 0;
      const parser = new DataParser(() => {
        attempts++;
        if (attempts === 1) {
          throw failure;
        }
      });
      expectSyncFailure(() => { parser.parse([makeGroup(type, 1, 'failed')]); }, failure);
      const result = await parser.parse([makeGroup(type, 1, 'retry')]);
      expect(attempts).assertEqual(2);
      expect(resolver.calls).assertEqual(1);
      expect(snapshotTitles(result)).assertDeepEquals(['retry:0']);
    });

    it('ExecutionBoundaryTest_emptyLayoutStillRunsWorkloadOnce', 0, async () => {
      let calls = 0;
      const source = await new DataParser(() => { calls++; }).parse([]);
      expect(calls).assertEqual(1);
      expect(source.totalCount()).assertEqual(0);
    });

    it('ExecutionBoundaryTest_workloadCanRegisterPendingType', 0, async () => {
      const type = 'boundary.execution.register';
      const resolver = new RecordingResolver();
      const parser = new DataParser(() => { registry.registerCard(type, resolver); });
      const source = await parser.parse([makeGroup(type, 1, 'registered')]);
      expect(resolver.calls).assertEqual(1);
      expect(source.getData(0).data === resolver.models[0].data).assertTrue();
    });

    it('ExecutionBoundaryTest_workloadMutatesObjectBeforeTraversal', 0, async () => {
      const type = 'boundary.execution.input-mutation';
      const group = makeGroup(type, 1, 'original');
      registry.registerCard(type, new RecordingResolver());
      const parser = new DataParser(() => {
        group.data.push(makePayload('added', '75%', 1));
        group.data[0].item.title.name = 'updated';
      });
      const source = await parser.parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['updated', 'added']);
      expect(source.getData(1).data === group.data[1]).assertTrue();
    });

    it('ExecutionBoundaryTest_resolverSeesStyleBeforeFormulaInstallation', 0, async () => {
      const type = 'boundary.execution.style-order';
      const originalWidths: string[] = [];
      const resolver = new CallbackResolver((model) => {
        originalWidths.push(model.data.style.width);
        expect(inspectProperty(model.data.style, 'width').hasGetter).assertFalse();
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      const group = makeGroup(type, 1, 'style');
      group.data[0].style.width = '63%';
      const source = await new DataParser(() => {}).parse([group]);
      expect(originalWidths).assertDeepEquals(['63%']);
      expect(inspectProperty(source.getData(0).opt('style'), 'width').hasGetter).assertTrue();
    });

    it('ExecutionBoundaryTest_replacementResolverAppliesToNextPayload', 0, async () => {
      const type = 'boundary.execution.replace-mid-group';
      const next = new RecordingResolver();
      const first = new CallbackResolver((model) => {
        registry.registerCard(type, next);
        return new CardData(model);
      });
      registry.registerCard(type, first);
      const group = makeGroup(type, 3, 'replace');
      const source = await new DataParser(() => {}).parse([group]);
      expect(first.models.length).assertEqual(1);
      expect(next.calls).assertEqual(2);
      expect(next.models[0].data === group.data[1]).assertTrue();
      expect(snapshotTitles(source)).assertDeepEquals(['replace:0', 'replace:1', 'replace:2']);
    });

    it('ExecutionBoundaryTest_resolverCanEnableLaterGroup', 0, async () => {
      const type = 'boundary.execution.register-later';
      const laterType = type + '.later';
      const later = new RecordingResolver();
      registry.registerCard(type, new CallbackResolver((model) => {
        registry.registerCard(laterType, later);
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse([
        makeGroup(type, 1, 'first'), makeGroup(laterType, 1, 'later')
      ]);
      expect(later.calls).assertEqual(1);
      expect(snapshotTitles(source)).assertDeepEquals(['first:0', 'later:0']);
    });

    it('ExecutionBoundaryTest_resolverAppendIsIncludedInCurrentGroup', 0, async () => {
      const type = 'boundary.execution.append';
      const group = makeGroup(type, 1, 'initial');
      registry.registerCard(type, new CallbackResolver((model, index) => {
        if (index === 0) {
          group.data.push(makePayload('appended', '20%', 1));
        }
        return new CardData(model);
      }));
      const source = await new DataParser(() => {}).parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['initial:0', 'appended']);
      expect(source.getData(1).data === group.data[1]).assertTrue();
    });

    it('ExecutionBoundaryTest_middleFailureStopsRemainingResolvers', 0, () => {
      const type = 'boundary.execution.partial-failure';
      const failure = new Error('second payload failed');
      const group = makeGroup(type, 3, 'partial');
      const resolver = new CallbackResolver((model, index) => {
        if (index === 1) {
          throw failure;
        }
        return new CardData(model);
      });
      registry.registerCard(type, resolver);
      expectSyncFailure(() => { new DataParser(() => {}).parse([group]); }, failure);
      expect(resolver.models.length).assertEqual(2);
      expect(resolver.cards.length).assertEqual(1);
      expect(inspectProperty(group.data[0].style, 'width').hasGetter).assertTrue();
      expect(inspectProperty(group.data[1].style, 'width').hasGetter).assertFalse();
      expect(inspectProperty(group.data[2].style, 'width').hasGetter).assertFalse();
    });

    it('ExecutionBoundaryTest_reentrantParseKeepsSeparateOutput', 0, async () => {
      const type = 'boundary.execution.reentrant';
      const innerType = type + '.inner';
      registry.registerCard(innerType, new RecordingResolver());
      const innerResults: Promise<DataSource>[] = [];
      const parser = new DataParser(() => {});
      registry.registerCard(type, new CallbackResolver((model, index) => {
        if (index === 0) {
          innerResults.push(parser.parse([makeGroup(innerType, 1, 'inner')]));
        }
        return new CardData(model);
      }));
      const outer = await parser.parse([makeGroup(type, 2, 'outer')]);
      const inner = await innerResults[0];
      expect(snapshotTitles(outer)).assertDeepEquals(['outer:0', 'outer:1']);
      expect(snapshotTitles(inner)).assertDeepEquals(['inner:0']);
      expect(outer === inner).assertFalse();
    });

    it('ExecutionBoundaryTest_resolverReturnedCardIsStoredVerbatim', 0, async () => {
      const type = 'boundary.execution.returned-card';
      const replacement = new CardData({ type: type + '.output', data: makePayload('replacement', '90%', 8) });
      const resolver = new CallbackResolver(() => replacement);
      registry.registerCard(type, resolver);
      const group = makeGroup(type, 1, 'input');
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.getData(0) === replacement).assertTrue();
      expect(snapshotTitles(source)).assertDeepEquals(['replacement']);
      expect(inspectProperty(group.data[0].style, 'width').hasGetter).assertTrue();
      expect(inspectProperty(replacement.opt('style'), 'width').hasGetter).assertFalse();
    });
  });
}
