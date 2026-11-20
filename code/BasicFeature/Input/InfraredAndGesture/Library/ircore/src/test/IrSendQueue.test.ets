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

import { describe, expect, it } from '@ohos/hypium';
import {
  SendFrame,
  SendJob,
  SendStep,
  SendTicket
} from '../main/ets/model/IrTypes';
import { IrSendQueue } from '../main/ets/service/IrSendQueue';

function buildJob(): SendJob {
  const frame: SendFrame = new SendFrame();
  frame.frequencyHz = 38000;
  frame.pattern = [9000, 4500];

  const step: SendStep = new SendStep();
  step.index = 0;
  step.deviceId = 'demo-device';
  step.keyId = 'demo-key';
  step.frames = [frame];
  step.delayMs = 0;

  const job: SendJob = new SendJob();
  job.steps = [step];
  return job;
}

export default function irSendQueueTest() {
  describe('IrSendQueue', () => {
    it('rejects_second_job_and_returns_idle', 0, async () => {
      const queue: IrSendQueue = IrSendQueue.getInstance();
      await queue.waitIdle();

      const first: SendTicket = queue.enqueue(buildJob());
      expect(first.accepted).assertTrue();
      expect(first.ticketId.length > 0).assertTrue();
      expect(queue.isBusy()).assertTrue();

      const second: SendTicket = queue.enqueue(buildJob());
      expect(second.accepted).assertFalse();
      expect(second.reason).assertEqual('BUSY');

      await queue.waitIdle();
      expect(queue.isBusy()).assertFalse();
    });
  });
}
