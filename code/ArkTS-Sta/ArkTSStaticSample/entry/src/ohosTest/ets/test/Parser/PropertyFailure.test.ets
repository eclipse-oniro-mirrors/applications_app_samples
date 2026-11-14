/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParser } from 'library/src/main/ets/components/dyn/DataParser';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { makeGroup, RecordingResolver, snapshotTitles } from '../Shared/ScenarioSupport';
import { expectSyncFailure, yieldBetweenCases } from '../Shared/BoundarySupport';
import { setReadProperty, deleteProperty, freezeObject } from '../Shared/BoundaryFixtures';
import { inspectProperty } from '../Shared/PropertyInspection';

export default function propertyFailureTest(): void {
  describe('PropertyFailureTest', () => {
    beforeEach(yieldBetweenCases);

    it('PropertyFailureTest_groupDataGetterFailsAfterWorkloadBeforeResolution', 0, () => {
      const type = 'round2.property.group-data';
      const group = makeGroup(type, 1, 'blocked');
      const failure = new Error('group data getter failed');
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const events: string[] = [];
      setReadProperty(group, 'data', () => {
        events.push('data');
        throw failure;
      });
      const parser = new DataParser(() => { events.push('workload'); });
      expectSyncFailure(() => { parser.parse([group]); }, failure);
      expect(events).assertDeepEquals(['workload', 'data']);
      expect(resolver.calls).assertEqual(0);
    });

    it('PropertyFailureTest_typeGetterFailureDoesNotTouchPayloadStyle', 0, () => {
      const group = makeGroup('round2.property.type', 1, 'blocked');
      const failure = new Error('type getter failed');
      let styleReads = 0;
      setReadProperty(group.data[0], 'style', () => {
        styleReads++;
        throw new Error('style must not be read');
      });
      setReadProperty(group, 'type', () => { throw failure; });
      expectSyncFailure(() => { new DataParser(() => {}).parse([group]); }, failure);
      expect(styleReads).assertEqual(0);
    });

    it('PropertyFailureTest_unknownResolverSkipsThrowingStyleGetter', 0, async () => {
      const group = makeGroup('round2.property.unknown', 1, 'skipped');
      let reads = 0;
      setReadProperty(group.data[0], 'style', () => {
        reads++;
        throw new Error('unknown payload style must not be read');
      });
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.totalCount()).assertEqual(0);
      expect(reads).assertEqual(0);
    });

    it('PropertyFailureTest_emptyGroupDoesNotEvaluateTypeGetter', 0, async () => {
      const empty = makeGroup('round2.property.empty', 0, 'empty');
      let reads = 0;
      setReadProperty(empty, 'type', () => {
        reads++;
        throw new Error('empty group type must not be read');
      });
      const source = await new DataParser(() => {}).parse([empty]);
      expect(source.totalCount()).assertEqual(0);
      expect(reads).assertEqual(0);
    });

    it('PropertyFailureTest_styleGetterFailureOccursAfterResolverCreation', 0, async () => {
      const type = 'round2.property.style';
      const group = makeGroup(type, 1, 'broken');
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      const originalStyle = group.data[0].style;
      const failure = new Error('style getter failed');
      setReadProperty(group.data[0], 'style', () => { throw failure; });
      const parser = new DataParser(() => {});
      expectSyncFailure(() => { parser.parse([group]); }, failure);
      expect(resolver.calls).assertEqual(1);
      expect(resolver.models[0].data === group.data[0]).assertTrue();
      setReadProperty(group.data[0], 'style', () => originalStyle);
      const source = await parser.parse([group]);
      expect(snapshotTitles(source)).assertDeepEquals(['broken:0']);
      expect(resolver.calls).assertEqual(2);
      expect(inspectProperty(originalStyle, 'width').hasGetter).assertTrue();
    });

    it('PropertyFailureTest_missingStyleStopsLaterPayloadsWithoutRollingBackEarlierMutation', 0, () => {
      const type = 'round2.property.missing-style';
      const group = makeGroup(type, 3, 'partial');
      deleteProperty(group.data[1], 'style');
      const resolver = new RecordingResolver();
      registry.registerCard(type, resolver);
      let caught = false;
      try {
        new DataParser(() => {}).parse([group]);
      } catch (error) {
        caught = error instanceof TypeError;
      }
      expect(caught).assertTrue();
      expect(resolver.calls).assertEqual(2);
      expect(inspectProperty(group.data[0].style, 'width').hasGetter).assertTrue();
      expect(inspectProperty(group.data[2].style, 'width').hasGetter).assertFalse();
    });

    it('PropertyFailureTest_frozenPayloadStillAllowsMutationOfItsMutableStyle', 0, async () => {
      const type = 'round2.property.frozen-payload';
      const group = makeGroup(type, 1, 'frozen');
      const originalStyle = group.data[0].style;
      registry.registerCard(type, new RecordingResolver());
      freezeObject(group.data[0]);
      const source = await new DataParser(() => {}).parse([group]);
      expect(source.getData(0).opt('style') === originalStyle).assertTrue();
      expect(inspectProperty(originalStyle, 'width').hasGetter).assertTrue();
      expect(group.data[0].item.title.name).assertEqual('frozen:0');
    });
  });
}
