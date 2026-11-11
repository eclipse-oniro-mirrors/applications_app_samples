import { describe, expect, it } from '@ohos/hypium';
import { AppService } from '../../../main/ets/core/AppService';
import { FakePlatform, MemoryStore, fixtureError } from '../support/FakePlatform';
import { RejectionPlatform } from '../support/CoveragePlatform';

export default function performanceInputWaveTwoTests(): void {
  describe('PerformanceInputWaveTwo', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_INPUTWAVETWO_0100
     * @tc.name testPerformanceInputWaveTwo0001
     * @tc.desc 真实存档混入非对象日志和启动项时只过滤坏元素，合法项与调用编号继续恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceInputWaveTwo0001', 0, async (): Promise<void> => {
      const store = new MemoryStore();
      const original = AppService.fromPlatform(new FakePlatform(store));
      original.setSnapEnabled(true); original.markContentLoaded();
      await original.whenSaved();
      const savedCall = original.getState().logs[0];
      const savedLaunch = original.getState().launches[0];
      original.dispose();
      const raw = JSON.parse(store.value) as Record<string, Object>;
      raw['logs'] = [JSON.parse('null') as Object, savedCall, 7, 'bad-log'];
      raw['launches'] = [false, savedLaunch, JSON.parse('null') as Object, 'bad-launch'];
      store.value = JSON.stringify(raw);
      const reopened = AppService.fromPlatform(new FakePlatform(store));
      try {
        expect(reopened.getState().logs.map((record): number => record.id).join('|')).assertEqual(`${savedCall.id}`);
        expect(reopened.getState().launches.map((sample): string => sample.id).join('|')).assertEqual(savedLaunch.id);
        expect(reopened.getState().storageMessage).assertEqual('');
        reopened.setSnapEnabled(false);
        expect(reopened.getState().logs[0].id).assertEqual(savedCall.id + 1);
        await reopened.whenSaved();
      } finally { reopened.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_INPUTWAVETWO_0200
     * @tc.name testPerformanceInputWaveTwo0002
     * @tc.desc SDK错误对象的空消息使用失败兜底，有限零错误码仍原样保存且释放忙状态
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceInputWaveTwo0002', 0, async (): Promise<void> => {
      const platform = new RejectionPlatform(); platform.failure = fixtureError(0, '');
      const service = AppService.fromPlatform(platform);
      try {
        const result = await service.evictFiles(['entry.hap']);
        const memory = service.getState().latestMemory;
        if (memory === undefined) { throw new Error('Missing real eviction result'); }
        expect(result.status).assertEqual('rejected');
        expect(result.code).assertEqual(0);
        expect(memory.message).assertEqual('调用失败');
        expect(service.isExperimentBusy()).assertFalse();
      } finally { service.dispose(); }
    });
  });
}
