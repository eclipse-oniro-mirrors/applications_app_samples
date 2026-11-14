/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

// @device-only: real static factory, taskpool, JSON conversion and dynamic wrapper.
import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { DataParserStaW } from 'library/src/main/ets/components/sta_wrapper/DataParserStaW';
import { RESOLVER_REGISTRY as registry } from 'library/src/main/ets/components/dyn/ResolverRegistry';
import { CardResolver } from '../../../../main/ets/pages/CardResolver';
import { TextCardData } from '../../../../main/ets/pages/TextCardData';
import { makeGroup, waitForNativeFactory, snapshotTitles } from '../Shared/ScenarioSupport';
import { yieldBetweenCases } from '../Shared/BoundarySupport';

export default function staticInputBoundaryTest(): void {
  describe('StaticInputBoundaryTest', () => {
    beforeEach(async () => {
      await yieldBetweenCases();
      await waitForNativeFactory();
    });

    it('StaticInputBoundaryTest_serializedObjectGroupUsesStaticObjectBranch', 0, async () => {
      const type = 'boundary.static.object-root';
      registry.registerCard(type, new CardResolver());
      const group = makeGroup(type, 2, 'object');
      const output = await new DataParserStaW().parse(JSON.stringify(group));
      expect(snapshotTitles(output)).assertDeepEquals(['object:0', 'object:1']);
      expect(output.getData(0) instanceof TextCardData).assertTrue();
      expect(output.getData(0).type).assertEqual(type);
      expect(output.getData(0).data === group.data[0]).assertFalse();
    });

    it('StaticInputBoundaryTest_singlePayloadObjectIsConverted', 0, async () => {
      const type = 'boundary.static.single-payload';
      registry.registerCard(type, new CardResolver());
      const output = await new DataParserStaW().parse(
        '{"type":"' + type + '","data":{"item":{"title":{"name":"single"}},"sequence":7}}'
      );
      expect(snapshotTitles(output)).assertDeepEquals(['single']);
      expect(output.getData(0).opt('sequence')).assertEqual(7);
      expect(output.getData(0) instanceof TextCardData).assertTrue();
    });

    it('StaticInputBoundaryTest_missingDataGroupDoesNotBlockLaterGroup', 0, async () => {
      const type = 'boundary.static.missing-data';
      registry.registerCard(type, new CardResolver());
      const healthy = JSON.stringify(makeGroup(type, 1, 'healthy'));
      const output = await new DataParserStaW().parse('[{"type":"' + type + '"},' + healthy + ']');
      expect(snapshotTitles(output)).assertDeepEquals(['healthy:0']);
      expect(output.getData(0).opt('sequence')).assertEqual(0);
    });

    it('StaticInputBoundaryTest_missingTypeFailureIsContainedWithinGroup', 0, async () => {
      const type = 'boundary.static.missing-type';
      registry.registerCard(type, new CardResolver());
      const healthy = JSON.stringify(makeGroup(type, 1, 'survivor'));
      const output = await new DataParserStaW().parse('[{"data":[{"sequence":9}]},' + healthy + ']');
      expect(snapshotTitles(output)).assertDeepEquals(['survivor:0']);
      expect(output.getData(0).type).assertEqual(type);
    });

    it('StaticInputBoundaryTest_unknownMalformedPayloadIsSkipped', 0, async () => {
      const type = 'boundary.static.unknown-malformed';
      registry.registerCard(type, new CardResolver());
      const healthy = JSON.stringify(makeGroup(type, 1, 'known'));
      const output = await new DataParserStaW().parse(
        '[{"type":"' + type + '.unknown","data":[17,false,"not-a-card"]},' + healthy + ']'
      );
      expect(snapshotTitles(output)).assertDeepEquals(['known:0']);
      expect(registry.getCardResolver(type + '.unknown')).assertUndefined();
    });

    it('StaticInputBoundaryTest_nestedRecordsArraysAndScalarsSurviveBridge', 0, async () => {
      const type = 'boundary.static.nested-values';
      registry.registerCard(type, new CardResolver());
      const output = await new DataParserStaW().parse(
        '[{"type":"' + type + '","data":[{"item":{"title":{"name":"nested"}},' +
        '"enabled":false,"amount":-12.5,"extra":{"flag":true,"label":""},' +
        '"values":[1,"two",false,{"deep":[3,true]}]}]}]'
      );
      const card = output.getData(0);
      expect(output.totalCount()).assertEqual(1);
      expect(card.opt('enabled')).assertFalse();
      expect(card.opt('amount')).assertEqual(-12.5);
      expect(card.opt('extra').flag).assertTrue();
      expect(card.opt('extra').label).assertEqual('');
      expect(card.opt('values')[0]).assertEqual(1);
      expect(card.opt('values')[1]).assertEqual('two');
      expect(card.opt('values')[2]).assertFalse();
      expect(card.opt('values')[3].deep[0]).assertEqual(3);
      expect(card.opt('values')[3].deep[1]).assertTrue();
    });

    it('StaticInputBoundaryTest_invalidJsonRejectsAndSameInstanceRecovers', 0, async () => {
      const type = 'boundary.static.invalid-json';
      registry.registerCard(type, new CardResolver());
      const parser = new DataParserStaW();
      let rejected = false;
      try {
        await parser.parse('[');
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      const output = await parser.parse([makeGroup(type, 1, 'retry')]);
      expect(snapshotTitles(output)).assertDeepEquals(['retry:0']);
      expect(output.getData(0) instanceof TextCardData).assertTrue();
    });

    it('StaticInputBoundaryTest_objectInputIsSnapshottedBeforeAsyncTask', 0, async () => {
      const type = 'boundary.static.snapshot';
      registry.registerCard(type, new CardResolver());
      const group = makeGroup(type, 1, 'before');
      const pending = new DataParserStaW().parse([group]);
      group.data[0].item.title.name = 'after';
      group.data.push(makeGroup(type, 1, 'new').data[0]);
      const output = await pending;
      expect(snapshotTitles(output)).assertDeepEquals(['before:0']);
      expect(group.data.length).assertEqual(2);
      expect(group.data[0].item.title.name).assertEqual('after');
    });
  });
}
