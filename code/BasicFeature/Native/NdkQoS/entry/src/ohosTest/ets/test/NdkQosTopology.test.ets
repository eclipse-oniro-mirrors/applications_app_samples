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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { AffinityReport, CpuTopology, ResetAffinityReport } from 'libentry.so';

const TAG: string = '[Sample_NdkQosTopologyTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const CODE_INVALID_ARG: number = 401;
const INVALID_RESULT: number = -1;
const LOOP_LIMIT: number = 8;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

function isAscending(values: number[]): boolean {
  for (let index = 1; index < values.length; index++) {
    if (values[index] <= values[index - 1]) {
      return false;
    }
  }
  return true;
}

function containsCpu(values: number[], cpu: number): boolean {
  for (let index = 0; index < values.length; index++) {
    if (values[index] === cpu) {
      return true;
    }
  }
  return false;
}

function copyCpus(values: number[]): number[] {
  const copied: number[] = [];
  for (let index = 0; index < values.length; index++) {
    copied.push(values[index]);
  }
  return copied;
}

function sameCpus(left: number[], right: number[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

export default function ndkQosTopologyTest(): void {
  describe('NdkQosTopology', () => {
    afterEach(async () => {
      await sleepMs(SETTLE_INTERVAL);
      testNapi.resetThreadAffinity();
    });

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0001
     * @tc.name      testNdkQosTopology0001
     * @tc.desc      Checks the topology reports a usable CPU count and a default computation CPU.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0001 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('cpuCount = ' + topology.cpuCount.toString() + ', selectedCpu = ' + topology.selectedCpu.toString());
      expect(topology.code).assertEqual(CODE_OK);
      expect(topology.cpuCount).assertLarger(0);
      expect(topology.selectedCpu >= 0).assertTrue();
      expect(topology.selectedCpu < topology.cpuCount).assertTrue();
      logInfo('testNdkQosTopology0001 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0002
     * @tc.name      testNdkQosTopology0002
     * @tc.desc      Checks the affinity list matches its own count and stays inside the online CPU range.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0002 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      let insideRange: boolean = true;
      for (let index = 0; index < topology.affinityCpus.length; index++) {
        const cpu: number = topology.affinityCpus[index];
        if (cpu < 0 || cpu >= topology.cpuCount) {
          insideRange = false;
        }
      }
      logInfo('affinity = ' + topology.affinityCpus.join(','));
      expect(topology.affinityCount).assertEqual(topology.affinityCpus.length);
      expect(topology.affinityCount).assertLarger(0);
      expect(insideRange).assertTrue();
      logInfo('testNdkQosTopology0002 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0003
     * @tc.name      testNdkQosTopology0003
     * @tc.desc      Checks the affinity list is strictly ascending so callers can treat it as a set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0003 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      expect(isAscending(topology.affinityCpus)).assertTrue();
      expect(topology.affinityCount).assertLarger(0);
      expect(topology.affinityCpus.length).assertEqual(topology.affinityCount);
      logInfo('testNdkQosTopology0003 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0004
     * @tc.name      testNdkQosTopology0004
     * @tc.desc      Checks two consecutive calls report the same CPU count and default CPU.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0004 begin');
      const first: CpuTopology = testNapi.getCpuTopology();
      const second: CpuTopology = testNapi.getCpuTopology();
      expect(second.cpuCount).assertEqual(first.cpuCount);
      expect(second.selectedCpu).assertEqual(first.selectedCpu);
      expect(second.affinityCount > 0).assertTrue();
      logInfo('testNdkQosTopology0004 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0005
     * @tc.name      testNdkQosTopology0005
     * @tc.desc      Checks resetting the affinity makes every online CPU available again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0005 begin');
      testNapi.bindCurrentThread(0);
      const report: ResetAffinityReport = testNapi.resetThreadAffinity();
      logInfo('affinity after reset = ' + report.affinityCpus.join(','));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.bindResult).assertEqual(0);
      expect(report.affinityCount).assertLarger(0);
      expect(containsCpu(report.affinityCpus, 0)).assertTrue();
      logInfo('testNdkQosTopology0005 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0006
     * @tc.name      testNdkQosTopology0006
     * @tc.desc      Checks binding the current thread to CPU 0 reports the bound CPU and its mask.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0006 begin');
      const report: AffinityReport = testNapi.bindCurrentThread(0);
      logInfo('bind report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.bindResult).assertEqual(0);
      expect(report.cpu).assertEqual(0);
      expect(report.affinityCount).assertEqual(1);
      expect(report.affinityCpus[0]).assertEqual(0);
      logInfo('testNdkQosTopology0006 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0007
     * @tc.name      testNdkQosTopology0007
     * @tc.desc      Checks binding to the last online CPU succeeds and narrows the mask to that CPU.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0007 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      const lastCpu: number = topology.cpuCount - 1;
      const report: AffinityReport = testNapi.bindCurrentThread(lastCpu);
      logInfo('bind last cpu report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.cpu).assertEqual(lastCpu);
      expect(report.affinityCount).assertEqual(1);
      expect(containsCpu(report.affinityCpus, lastCpu)).assertTrue();
      logInfo('testNdkQosTopology0007 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0008
     * @tc.name      testNdkQosTopology0008
     * @tc.desc      Checks binding to a middle CPU is accepted when the device has several CPUs.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0008 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      const middleCpu: number = Math.floor(topology.cpuCount / 2);
      const report: AffinityReport = testNapi.bindCurrentThread(middleCpu);
      logInfo('bind middle cpu report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.cpu).assertEqual(middleCpu);
      expect(middleCpu < topology.cpuCount).assertTrue();
      expect(containsCpu(report.affinityCpus, middleCpu)).assertTrue();
      logInfo('testNdkQosTopology0008 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0009
     * @tc.name      testNdkQosTopology0009
     * @tc.desc      Checks binding twice keeps only the most recent CPU in the affinity mask.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0009 begin');
      const first: AffinityReport = testNapi.bindCurrentThread(0);
      const second: AffinityReport = testNapi.bindCurrentThread(0);
      expect(first.affinityCount).assertEqual(1);
      expect(second.affinityCount).assertEqual(1);
      expect(second.affinityCpus[0]).assertEqual(0);
      expect(second.cpu).assertEqual(0);
      logInfo('testNdkQosTopology0009 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0010
     * @tc.name      testNdkQosTopology0010
     * @tc.desc      Checks the topology read back after binding reports the narrowed affinity mask.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0010 begin');
      const before: CpuTopology = testNapi.getCpuTopology();
      testNapi.bindCurrentThread(0);
      const after: CpuTopology = testNapi.getCpuTopology();
      logInfo('affinity before = ' + before.affinityCount.toString() + ', after = ' + after.affinityCount.toString());
      expect(after.affinityCount).assertEqual(1);
      expect(after.affinityCpus[0]).assertEqual(0);
      expect(after.cpuCount).assertEqual(before.cpuCount);
      expect(after.selectedCpu).assertEqual(before.selectedCpu);
      logInfo('testNdkQosTopology0010 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0011
     * @tc.name      testNdkQosTopology0011
     * @tc.desc      Checks a negative CPU index is rejected before it reaches the scheduler.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0011 begin');
      const report: AffinityReport = testNapi.bindCurrentThread(-1);
      logInfo('negative cpu report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.cpu).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      expect(report.affinityCount).assertEqual(0);
      logInfo('testNdkQosTopology0011 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0012
     * @tc.name      testNdkQosTopology0012
     * @tc.desc      Checks a CPU index equal to the CPU count is rejected instead of being clamped.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0012 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      const report: AffinityReport = testNapi.bindCurrentThread(topology.cpuCount);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.cpu).assertEqual(INVALID_RESULT);
      expect(report.affinityCpus.length).assertEqual(0);
      expect(topology.cpuCount > 0).assertTrue();
      logInfo('testNdkQosTopology0012 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0013
     * @tc.name      testNdkQosTopology0013
     * @tc.desc      Checks a far out of range CPU index is rejected and keeps the error fields stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0013 begin');
      const report: AffinityReport = testNapi.bindCurrentThread(1024);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      expect(report.affinityCount).assertEqual(0);
      logInfo('testNdkQosTopology0013 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0014
     * @tc.name      testNdkQosTopology0014
     * @tc.desc      Checks a fractional CPU index is rejected because core indexes are integers.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0014 begin');
      const report: AffinityReport = testNapi.bindCurrentThread(1.5);
      logInfo('fractional cpu report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.cpu).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosTopology0014 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0015
     * @tc.name      testNdkQosTopology0015
     * @tc.desc      Checks a large negative CPU index is rejected and keeps the affinity mask as it was.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0015 begin');
      const before: CpuTopology = testNapi.getCpuTopology();
      const report: AffinityReport = testNapi.bindCurrentThread(-1024);
      const after: CpuTopology = testNapi.getCpuTopology();
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.affinityCount).assertEqual(0);
      expect(after.affinityCount).assertEqual(before.affinityCount);
      logInfo('testNdkQosTopology0015 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0016
     * @tc.name      testNdkQosTopology0016
     * @tc.desc      Checks a rejected binding leaves the current affinity mask untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0016 begin');
      const before: CpuTopology = testNapi.getCpuTopology();
      const beforeCpus: number[] = copyCpus(before.affinityCpus);
      testNapi.bindCurrentThread(-5);
      const after: CpuTopology = testNapi.getCpuTopology();
      expect(sameCpus(beforeCpus, after.affinityCpus)).assertTrue();
      expect(after.affinityCount).assertLarger(0);
      expect(after.affinityCount).assertEqual(before.affinityCount);
      logInfo('testNdkQosTopology0016 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0017
     * @tc.name      testNdkQosTopology0017
     * @tc.desc      Checks resetting the affinity twice keeps every online CPU available.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0017 begin');
      const first: ResetAffinityReport = testNapi.resetThreadAffinity();
      const second: ResetAffinityReport = testNapi.resetThreadAffinity();
      logInfo('reset counts: ' + first.affinityCount.toString() + ', ' + second.affinityCount.toString());
      expect(second.code).assertEqual(CODE_OK);
      expect(second.affinityCount).assertEqual(first.affinityCount);
      expect(sameCpus(first.affinityCpus, second.affinityCpus)).assertTrue();
      logInfo('testNdkQosTopology0017 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0018
     * @tc.name      testNdkQosTopology0018
     * @tc.desc      Checks the affinity count never exceeds the reported CPU count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0018 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      expect(topology.affinityCount <= topology.cpuCount).assertTrue();
      expect(topology.affinityCount).assertLarger(0);
      expect(topology.cpuCount).assertLarger(0);
      logInfo('testNdkQosTopology0018 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0019
     * @tc.name      testNdkQosTopology0019
     * @tc.desc      Checks every online CPU can be bound in turn and released back to the default mask.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0019 begin');
      const topology: CpuTopology = testNapi.getCpuTopology();
      const limit: number = Math.min(topology.cpuCount, LOOP_LIMIT);
      let succeeded: number = 0;
      for (let cpu = 0; cpu < limit; cpu++) {
        const report: AffinityReport = testNapi.bindCurrentThread(cpu);
        if (report.code === CODE_OK && report.bindResult === 0 && report.affinityCpus[0] === cpu) {
          succeeded++;
        }
      }
      logInfo('bound cpus = ' + succeeded.toString() + ' of ' + limit.toString());
      expect(succeeded).assertEqual(limit);
      const reset: ResetAffinityReport = testNapi.resetThreadAffinity();
      expect(reset.affinityCount).assertLarger(0);
      expect(reset.code).assertEqual(CODE_OK);
      logInfo('testNdkQosTopology0019 end');
    })

    /**
     * @tc.number    SUB_QOS_TOPOLOGY_0020
     * @tc.name      testNdkQosTopology0020
     * @tc.desc      Checks the default computation CPU stays inside the online CPU range across calls.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosTopology0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosTopology0020 begin');
      const first: CpuTopology = testNapi.getCpuTopology();
      testNapi.bindCurrentThread(0);
      const second: CpuTopology = testNapi.getCpuTopology();
      const third: CpuTopology = testNapi.getCpuTopology();
      expect(second.selectedCpu >= 0 && second.selectedCpu < second.cpuCount).assertTrue();
      expect(third.selectedCpu).assertEqual(second.selectedCpu);
      expect(first.cpuCount).assertEqual(second.cpuCount);
      logInfo('testNdkQosTopology0020 end');
    })
  })
}
