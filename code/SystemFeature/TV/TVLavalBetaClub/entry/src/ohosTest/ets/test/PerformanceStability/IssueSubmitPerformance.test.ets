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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  serializedDelay,
  componentCount,
  ensureHomePage,
  backToHome,
  FocusLatencyAnalyzer,
  STRESS_ROUNDS_NAVIGATION,
  STRESS_ROUNDS_LIFECYCLE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_UPLOAD,
  DELAY_PAGE_SWITCH
} from '../Shared/BetaClubDriver';

const MAX_ATTACHMENT_COUNT: number = 4;

const MAX_DESCRIPTION_LENGTH: number = 1024;

const MAX_ATTACHMENT_SIZE_MB: number = 100;

const BYTES_PER_MB: number = 1024 * 1024;

const UPLOAD_PROGRESS_STEP: number = 10;

interface ProgressSample {
  uploaded: number;
  total: number;
  percent: number;
}

interface SubmitTask {
  id: string;
  attachmentCount: number;
  descriptionLength: number;
  startedAt: number;
  finishedAt: number;
}

// Validates upload progress arithmetic used by the attachment flow
class UploadProgressCalculator {
  public static percent(uploaded: number, total: number): number {
    if (total <= 0) {
      return 0;
    }
    if (uploaded <= 0) {
      return 0;
    }
    if (uploaded >= total) {
      return 100;
    }
    return Math.floor(uploaded * 100 / total);
  }

  public static isMonotonic(samples: ProgressSample[]): boolean {
    for (let i = 1; i < samples.length; i++) {
      if (samples[i].percent < samples[i - 1].percent) {
        return false;
      }
    }
    return true;
  }

  public static isComplete(sample: ProgressSample): boolean {
    return sample.percent === 100 && sample.uploaded >= sample.total;
  }

  public static buildSamples(total: number): ProgressSample[] {
    const samples: ProgressSample[] = [];
    for (let percent = 0; percent <= 100; percent += UPLOAD_PROGRESS_STEP) {
      samples.push({ uploaded: total * percent / 100, total: total, percent: percent });
    }
    return samples;
  }
}

// Guards the attachment limits enforced by IssueAttachment.ets
class AttachmentLimitGuard {
  public static isCountValid(count: number): boolean {
    return count >= 0 && count <= MAX_ATTACHMENT_COUNT;
  }

  public static canAdd(currentCount: number): boolean {
    return currentCount < MAX_ATTACHMENT_COUNT;
  }

  public static isDescriptionValid(length: number): boolean {
    return length >= 0 && length <= MAX_DESCRIPTION_LENGTH;
  }

  public static isSizeValid(sizeBytes: number): boolean {
    return sizeBytes >= 0 && sizeBytes <= MAX_ATTACHMENT_SIZE_MB * BYTES_PER_MB;
  }

  public static totalSize(sizes: number[]): number {
    let total: number = 0;
    for (let i = 0; i < sizes.length; i++) {
      total += sizes[i];
    }
    return total;
  }
}

// Tracks submission duration and enforces the upload budget
class SubmitPerformanceTracker {
  private tasks: SubmitTask[] = [];

  public complete(task: SubmitTask): void {
    this.tasks.push(task);
  }

  public getCount(): number {
    return this.tasks.length;
  }

  public getDurations(): number[] {
    return this.tasks.map((task: SubmitTask) => task.finishedAt - task.startedAt);
  }

  public getMaxDuration(): number {
    let max: number = 0;
    const durations = this.getDurations();
    for (let i = 0; i < durations.length; i++) {
      if (durations[i] > max) {
        max = durations[i];
      }
    }
    return max;
  }

  public getAverageDuration(): number {
    const durations = this.getDurations();
    if (durations.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < durations.length; i++) {
      total += durations[i];
    }
    return total / durations.length;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.getMaxDuration() <= budgetMs;
  }

  public reset(): void {
    this.tasks = [];
  }
}

// Serializable submission queue that never exceeds the attachment limit
class SubmitQueue {
  private pending: SubmitTask[] = [];

  public enqueue(task: SubmitTask): boolean {
    if (!AttachmentLimitGuard.isCountValid(task.attachmentCount)) {
      return false;
    }
    if (!AttachmentLimitGuard.isDescriptionValid(task.descriptionLength)) {
      return false;
    }
    this.pending.push(task);
    return true;
  }

  public size(): number {
    return this.pending.length;
  }

  public drain(): SubmitTask[] {
    const drained = [...this.pending];
    this.pending = [];
    return drained;
  }

  public clear(): void {
    this.pending = [];
  }
}

// Measures upload throughput across a session
class ThroughputAnalyzer {
  private samples: number[] = [];

  public record(bytesTransferred: number, elapsedMs: number): void {
    if (elapsedMs > 0) {
      this.samples.push(bytesTransferred / elapsedMs);
    }
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getAverageBytesPerMs(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total / this.samples.length;
  }

  public getMinBytesPerMs(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min: number = this.samples[0];
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i] < min) {
        min = this.samples[i];
      }
    }
    return min;
  }

  public isAboveFloor(floor: number): boolean {
    return this.getMinBytesPerMs() >= floor;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Aggregates submit sessions for stability assertions
class SubmitSessionRecorder {
  private success: number = 0;
  private failure: number = 0;
  private durations: number[] = [];

  public recordResult(success: boolean, durationMs: number): void {
    if (success) {
      this.success++;
    } else {
      this.failure++;
    }
    this.durations.push(durationMs);
  }

  public getSuccessCount(): number {
    return this.success;
  }

  public getFailureCount(): number {
    return this.failure;
  }

  public getTotalCount(): number {
    return this.success + this.failure;
  }

  public getSuccessRate(): number {
    const total = this.getTotalCount();
    if (total === 0) {
      return 0;
    }
    return this.success * 100 / total;
  }

  public getMaxDuration(): number {
    let max: number = 0;
    for (let i = 0; i < this.durations.length; i++) {
      if (this.durations[i] > max) {
        max = this.durations[i];
      }
    }
    return max;
  }

  public reset(): void {
    this.success = 0;
    this.failure = 0;
    this.durations = [];
  }
}

// Verifies progress percentages never regress or exceed the bound
class ProgressRoundingValidator {
  public static percentFor(uploaded: number, total: number): number {
    return UploadProgressCalculator.percent(uploaded, total);
  }

  public static isWithinRange(percent: number): boolean {
    return percent >= 0 && percent <= 100;
  }

  public static isStrictlyIncreasing(samples: ProgressSample[]): boolean {
    for (let i = 1; i < samples.length; i++) {
      if (samples[i].percent <= samples[i - 1].percent) {
        return false;
      }
    }
    return true;
  }

  public static completedCount(samples: ProgressSample[]): number {
    let count: number = 0;
    for (let i = 0; i < samples.length; i++) {
      if (UploadProgressCalculator.isComplete(samples[i])) {
        count++;
      }
    }
    return count;
  }
}

export default function issueSubmitPerformanceTest() {
  describe('IssueSubmitPerformance_Test', () => {
    let driver: Driver;
    let tracker: SubmitPerformanceTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new SubmitPerformanceTracker();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('upload_progress_should_start_and_end_correctly', 0, () => {
      expect(UploadProgressCalculator.percent(0, 1000)).assertEqual(0);
      expect(UploadProgressCalculator.percent(500, 1000)).assertEqual(50);
      expect(UploadProgressCalculator.percent(1000, 1000)).assertEqual(100);
      expect(UploadProgressCalculator.percent(2000, 1000)).assertEqual(100);
      expect(UploadProgressCalculator.percent(-1, 1000)).assertEqual(0);
      expect(UploadProgressCalculator.percent(100, 0)).assertEqual(0);
    });

    it('upload_progress_should_be_monotonic', 0, () => {
      const samples = UploadProgressCalculator.buildSamples(1024 * 1024);
      expect(samples.length).assertEqual(11);
      expect(UploadProgressCalculator.isMonotonic(samples)).assertTrue();
      expect(samples[0].percent).assertEqual(0);
      expect(samples[samples.length - 1].percent).assertEqual(100);
      expect(UploadProgressCalculator.isComplete(samples[samples.length - 1])).assertTrue();
    });

    it('upload_progress_should_detect_regression', 0, () => {
      const samples: ProgressSample[] = [
        { uploaded: 10, total: 100, percent: 10 },
        { uploaded: 5, total: 100, percent: 5 }
      ];
      expect(UploadProgressCalculator.isMonotonic(samples)).assertFalse();
      expect(UploadProgressCalculator.isComplete(samples[1])).assertFalse();
    });

    it('attachment_count_limit_should_be_enforced', 0, () => {
      expect(AttachmentLimitGuard.isCountValid(0)).assertTrue();
      expect(AttachmentLimitGuard.isCountValid(MAX_ATTACHMENT_COUNT)).assertTrue();
      expect(AttachmentLimitGuard.isCountValid(MAX_ATTACHMENT_COUNT + 1)).assertFalse();
      expect(AttachmentLimitGuard.isCountValid(-1)).assertFalse();
      expect(AttachmentLimitGuard.canAdd(0)).assertTrue();
      expect(AttachmentLimitGuard.canAdd(MAX_ATTACHMENT_COUNT - 1)).assertTrue();
      expect(AttachmentLimitGuard.canAdd(MAX_ATTACHMENT_COUNT)).assertFalse();
    });

    it('description_limit_should_be_enforced', 0, () => {
      expect(AttachmentLimitGuard.isDescriptionValid(0)).assertTrue();
      expect(AttachmentLimitGuard.isDescriptionValid(MAX_DESCRIPTION_LENGTH)).assertTrue();
      expect(AttachmentLimitGuard.isDescriptionValid(MAX_DESCRIPTION_LENGTH + 1)).assertFalse();
      expect(AttachmentLimitGuard.isDescriptionValid(-1)).assertFalse();
    });

    it('attachment_size_limit_should_be_enforced', 0, () => {
      expect(AttachmentLimitGuard.isSizeValid(0)).assertTrue();
      expect(AttachmentLimitGuard.isSizeValid(MAX_ATTACHMENT_SIZE_MB * BYTES_PER_MB)).assertTrue();
      expect(AttachmentLimitGuard.isSizeValid(MAX_ATTACHMENT_SIZE_MB * BYTES_PER_MB + 1)).assertFalse();
      expect(AttachmentLimitGuard.isSizeValid(-1)).assertFalse();
      expect(AttachmentLimitGuard.totalSize([1024, 2048, 4096])).assertEqual(7168);
    });

    it('submit_queue_should_accept_valid_tasks', 0, () => {
      const queue = new SubmitQueue();
      const task: SubmitTask = {
        id: 'task-1',
        attachmentCount: 2,
        descriptionLength: 100,
        startedAt: Date.now(),
        finishedAt: Date.now()
      };
      expect(queue.enqueue(task)).assertTrue();
      expect(queue.size()).assertEqual(1);
      const drained = queue.drain();
      expect(drained.length).assertEqual(1);
      expect(queue.size()).assertEqual(0);
      queue.clear();
      expect(queue.size()).assertEqual(0);
    });

    it('submit_queue_should_reject_invalid_tasks', 0, () => {
      const queue = new SubmitQueue();
      const tooManyAttachments: SubmitTask = {
        id: 'task-2',
        attachmentCount: MAX_ATTACHMENT_COUNT + 1,
        descriptionLength: 10,
        startedAt: 0,
        finishedAt: 0
      };
      const tooLongDescription: SubmitTask = {
        id: 'task-3',
        attachmentCount: 1,
        descriptionLength: MAX_DESCRIPTION_LENGTH + 1,
        startedAt: 0,
        finishedAt: 0
      };
      expect(queue.enqueue(tooManyAttachments)).assertFalse();
      expect(queue.enqueue(tooLongDescription)).assertFalse();
      expect(queue.size()).assertEqual(0);
    });

    it('submit_tracker_should_measure_durations', 0, () => {
      tracker.reset();
      const now = Date.now();
      tracker.complete({
        id: 'a', attachmentCount: 1, descriptionLength: 10, startedAt: now, finishedAt: now + 100
      });
      tracker.complete({
        id: 'b', attachmentCount: 2, descriptionLength: 20, startedAt: now, finishedAt: now + 300
      });
      expect(tracker.getCount()).assertEqual(2);
      expect(tracker.getMaxDuration()).assertEqual(300);
      expect(tracker.getAverageDuration()).assertEqual(200);
      expect(tracker.isWithinBudget(300)).assertTrue();
      expect(tracker.isWithinBudget(299)).assertFalse();
      tracker.reset();
      expect(tracker.getCount()).assertEqual(0);
      expect(tracker.getAverageDuration()).assertEqual(0);
    });

    it('submit_budget_should_cover_upload_timeout', 0, () => {
      expect(TIMEOUT_UPLOAD).assertEqual(5000);
      expect(TIMEOUT_UPLOAD).assertLarger(TIMEOUT_PAGE_RENDER);
      expect(TIMEOUT_UPLOAD).assertLarger(DELAY_PAGE_SWITCH);
    });

    it('stress_round_constants_should_be_positive', 0, () => {
      expect(STRESS_ROUNDS_NAVIGATION).assertEqual(20);
      expect(STRESS_ROUNDS_LIFECYCLE).assertEqual(10);
      expect(STRESS_ROUNDS_NAVIGATION).assertLarger(STRESS_ROUNDS_LIFECYCLE);
    });

    it('home_page_should_stay_rendered_under_repeated_probes', 0, async () => {
      const counts: number[] = [];
      for (let i = 0; i < 5; i++) {
        const count = await componentCount(driver);
        counts.push(count);
        await serializedDelay(driver, 100);
      }
      expect(counts.length).assertEqual(5);
      for (let i = 0; i < counts.length; i++) {
        expect(counts[i]).assertLargerOrEqual(1);
      }
    });

    it('focus_latency_should_remain_within_budget', 0, () => {
      const analyzer = new FocusLatencyAnalyzer();
      for (let i = 0; i < 10; i++) {
        analyzer.record(50 + i * 5);
      }
      expect(analyzer.getSampleCount()).assertEqual(10);
      expect(analyzer.getMaxLatency()).assertEqual(95);
      expect(analyzer.isWithinBudget(TIMEOUT_PAGE_RENDER)).assertTrue();
      analyzer.reset();
      expect(analyzer.getSampleCount()).assertEqual(0);
    });

    it('attachment_size_conversion_should_be_stable', 0, () => {
      expect(BYTES_PER_MB).assertEqual(1048576);
      expect(MAX_ATTACHMENT_SIZE_MB * BYTES_PER_MB).assertEqual(104857600);
      expect(MAX_ATTACHMENT_COUNT).assertEqual(4);
      expect(MAX_DESCRIPTION_LENGTH).assertEqual(1024);
      expect(UPLOAD_PROGRESS_STEP).assertEqual(10);
    });

    it('throughput_should_be_averaged_over_samples', 0, () => {
      const analyzer = new ThroughputAnalyzer();
      analyzer.record(1000, 100);
      analyzer.record(2000, 100);
      analyzer.record(3000, 100);
      expect(analyzer.getSampleCount()).assertEqual(3);
      expect(analyzer.getAverageBytesPerMs()).assertEqual(20);
      expect(analyzer.getMinBytesPerMs()).assertEqual(10);
      expect(analyzer.isAboveFloor(10)).assertTrue();
      expect(analyzer.isAboveFloor(11)).assertFalse();
    });

    it('throughput_should_ignore_zero_duration', 0, () => {
      const analyzer = new ThroughputAnalyzer();
      analyzer.record(1000, 0);
      analyzer.record(-1000, 100);
      expect(analyzer.getSampleCount()).assertEqual(1);
      expect(analyzer.getAverageBytesPerMs()).assertEqual(-10);
      expect(analyzer.isAboveFloor(0)).assertFalse();
      analyzer.reset();
      expect(analyzer.getSampleCount()).assertEqual(0);
      expect(analyzer.getAverageBytesPerMs()).assertEqual(0);
    });

    it('submit_session_should_compute_success_rate', 0, () => {
      const session = new SubmitSessionRecorder();
      session.recordResult(true, 100);
      session.recordResult(true, 200);
      session.recordResult(false, 300);
      expect(session.getSuccessCount()).assertEqual(2);
      expect(session.getFailureCount()).assertEqual(1);
      expect(session.getTotalCount()).assertEqual(3);
      expect(session.getSuccessRate()).assertLarger(66);
      expect(session.getMaxDuration()).assertEqual(300);
    });

    it('submit_session_should_handle_empty_state', 0, () => {
      const session = new SubmitSessionRecorder();
      expect(session.getTotalCount()).assertEqual(0);
      expect(session.getSuccessRate()).assertEqual(0);
      expect(session.getMaxDuration()).assertEqual(0);
      session.recordResult(true, 50);
      expect(session.getSuccessRate()).assertEqual(100);
      session.reset();
      expect(session.getTotalCount()).assertEqual(0);
    });

    it('progress_should_never_exceed_bounds', 0, () => {
      expect(ProgressRoundingValidator.isWithinRange(0)).assertTrue();
      expect(ProgressRoundingValidator.isWithinRange(100)).assertTrue();
      expect(ProgressRoundingValidator.isWithinRange(-1)).assertFalse();
      expect(ProgressRoundingValidator.isWithinRange(101)).assertFalse();
      for (let percent = 0; percent <= 100; percent += 5) {
        const value = ProgressRoundingValidator.percentFor(percent * 10, 1000);
        expect(ProgressRoundingValidator.isWithinRange(value)).assertTrue();
      }
    });

    it('progress_samples_should_be_strictly_increasing', 0, () => {
      const samples: ProgressSample[] = [
        { uploaded: 0, total: 1000, percent: 0 },
        { uploaded: 100, total: 1000, percent: 10 },
        { uploaded: 500, total: 1000, percent: 50 },
        { uploaded: 1000, total: 1000, percent: 100 }
      ];
      expect(ProgressRoundingValidator.isStrictlyIncreasing(samples)).assertTrue();
      expect(ProgressRoundingValidator.completedCount(samples)).assertEqual(1);
      const duplicate: ProgressSample[] = [
        { uploaded: 100, total: 1000, percent: 10 },
        { uploaded: 100, total: 1000, percent: 10 }
      ];
      expect(ProgressRoundingValidator.isStrictlyIncreasing(duplicate)).assertFalse();
    });

    it('progress_completion_should_require_full_transfer', 0, () => {
      expect(ProgressRoundingValidator.completedCount(UploadProgressCalculator.buildSamples(4096)))
        .assertEqual(1);
      const partial: ProgressSample = { uploaded: 4095, total: 4096, percent: 99 };
      expect(UploadProgressCalculator.isComplete(partial)).assertFalse();
      const overflowing: ProgressSample = { uploaded: 5000, total: 4096, percent: 100 };
      expect(UploadProgressCalculator.isComplete(overflowing)).assertTrue();
    });

    it('submit_budget_should_accept_boundary_duration', 0, () => {
      tracker.reset();
      const now = Date.now();
      tracker.complete({
        id: 'edge', attachmentCount: 4, descriptionLength: 1024,
        startedAt: now, finishedAt: now + TIMEOUT_UPLOAD
      });
      expect(tracker.isWithinBudget(TIMEOUT_UPLOAD)).assertTrue();
      tracker.complete({
        id: 'over', attachmentCount: 0, descriptionLength: 0,
        startedAt: now, finishedAt: now + TIMEOUT_UPLOAD + 1
      });
      expect(tracker.isWithinBudget(TIMEOUT_UPLOAD)).assertFalse();
      expect(tracker.getMaxDuration()).assertEqual(TIMEOUT_UPLOAD + 1);
    });

    it('attachment_total_size_should_respect_single_file_limit', 0, () => {
      const singleMax = MAX_ATTACHMENT_SIZE_MB * BYTES_PER_MB;
      const sizes: number[] = [singleMax, singleMax, singleMax, singleMax];
      expect(AttachmentLimitGuard.totalSize(sizes)).assertEqual(singleMax * MAX_ATTACHMENT_COUNT);
      for (let i = 0; i < sizes.length; i++) {
        expect(AttachmentLimitGuard.isSizeValid(sizes[i])).assertTrue();
      }
      sizes[3] = singleMax + 1;
      let oversize = 0;
      for (let i = 0; i < sizes.length; i++) {
        if (!AttachmentLimitGuard.isSizeValid(sizes[i])) {
          oversize++;
        }
      }
      expect(oversize).assertEqual(1);
    });

    it('submit_queue_should_handle_burst_within_limit', 0, () => {
      const queue = new SubmitQueue();
      for (let i = 0; i < 5; i++) {
        const accepted = queue.enqueue({
          id: `burst-${i}`,
          attachmentCount: i,
          descriptionLength: i * 10,
          startedAt: 0,
          finishedAt: 0
        });
        expect(accepted).assertTrue();
      }
      expect(queue.size()).assertEqual(5);
      expect(queue.drain().length).assertEqual(5);
      expect(queue.size()).assertEqual(0);
    });

    it('submit_queue_should_reject_negative_inputs', 0, () => {
      const queue = new SubmitQueue();
      expect(queue.enqueue({
        id: 'bad-a', attachmentCount: -1, descriptionLength: 10, startedAt: 0, finishedAt: 0
      })).assertFalse();
      expect(queue.enqueue({
        id: 'bad-b', attachmentCount: 1, descriptionLength: -1, startedAt: 0, finishedAt: 0
      })).assertFalse();
      expect(queue.enqueue({
        id: 'ok', attachmentCount: 0, descriptionLength: 0, startedAt: 0, finishedAt: 0
      })).assertTrue();
      expect(queue.size()).assertEqual(1);
      queue.clear();
    });

    it('performance_constants_should_remain_consistent', 0, () => {
      expect(TIMEOUT_UPLOAD).assertEqual(5000);
      expect(BYTES_PER_MB * MAX_ATTACHMENT_SIZE_MB).assertEqual(104857600);
      expect(MAX_ATTACHMENT_COUNT).assertEqual(4);
      expect(UPLOAD_PROGRESS_STEP).assertLarger(0);
      expect(100 / UPLOAD_PROGRESS_STEP).assertEqual(10);
    });
  });
}
