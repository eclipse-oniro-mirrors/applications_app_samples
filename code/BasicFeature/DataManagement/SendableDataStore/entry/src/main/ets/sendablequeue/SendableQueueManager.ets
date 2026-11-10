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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { QueueItem, DataType } from '../models/DataModels';
import { Logger } from '../utils/Logger';

/**
 * SendableQueueManager provides FIFO, LIFO, and priority queue operations
 * with enqueue, dequeue, peek, drain, batch, and conversion utilities.
 */
export class SendableQueueManager {
  private items: QueueItem[] = [];
  private queueSize: number = 0;
  private maxCapacity: number = DataStoreConstants.MAX_QUEUE_CAPACITY;
  private queueType: string = 'FIFO';
  private enqueueCount: number = 0;
  private dequeueCount: number = 0;
  private peekCount: number = 0;
  private createdAt: number = 0;
  private updatedAt: number = 0;

  constructor() {
  }

  initializeFIFO(capacity: number): string {
    if (!DataValidator.validateQueueCapacity(capacity, this.maxCapacity)) {
      return `initializeFIFO failed: invalid capacity ${capacity}`;
    }
    this.items = [];
    this.queueSize = 0;
    this.maxCapacity = capacity;
    this.queueType = 'FIFO';
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    this.enqueueCount = 0;
    this.dequeueCount = 0;
    this.peekCount = 0;
    return `FIFO queue initialized: capacity=${capacity}`;
  }

  initializeLIFO(capacity: number): string {
    if (!DataValidator.validateQueueCapacity(capacity, this.maxCapacity)) {
      return `initializeLIFO failed: invalid capacity ${capacity}`;
    }
    this.items = [];
    this.queueSize = 0;
    this.maxCapacity = capacity;
    this.queueType = 'LIFO';
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    this.enqueueCount = 0;
    this.dequeueCount = 0;
    this.peekCount = 0;
    return `LIFO stack initialized: capacity=${capacity}`;
  }

  initializePriority(capacity: number): string {
    if (!DataValidator.validateQueueCapacity(capacity, this.maxCapacity)) {
      return `initializePriority failed: invalid capacity ${capacity}`;
    }
    this.items = [];
    this.queueSize = 0;
    this.maxCapacity = capacity;
    this.queueType = 'PRIORITY';
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    this.enqueueCount = 0;
    this.dequeueCount = 0;
    this.peekCount = 0;
    return `Priority queue initialized: capacity=${capacity}`;
  }

  enqueueString(data: string, priority: number): string {
    if (this.queueSize >= this.maxCapacity) {
      return `enqueue failed: queue is full (${this.queueSize}/${this.maxCapacity})`;
    }
    if (!DataValidator.isValidPriority(priority)) {
      return 'enqueue failed: invalid priority (0-10)';
    }
    const item: QueueItem = {
      id: this.generateId(),
      data: data,
      priority: priority,
      enqueuedAt: Date.now(),
      dataType: DataType.STRING
    };
    this.insertItem(item);
    this.enqueueCount++;
    this.updatedAt = Date.now();
    return `enqueue completed: id=${item.id}, data=${data}, priority=${priority}`;
  }

  enqueueNumber(data: number, priority: number): string {
    if (this.queueSize >= this.maxCapacity) {
      return `enqueue failed: queue is full`;
    }
    if (!DataValidator.isValidPriority(priority)) {
      return 'enqueue failed: invalid priority';
    }
    const item: QueueItem = {
      id: this.generateId(),
      data: data,
      priority: priority,
      enqueuedAt: Date.now(),
      dataType: DataType.NUMBER
    };
    this.insertItem(item);
    this.enqueueCount++;
    this.updatedAt = Date.now();
    return `enqueue completed: id=${item.id}, data=${data}, priority=${priority}`;
  }

  enqueueBoolean(data: boolean, priority: number): string {
    if (this.queueSize >= this.maxCapacity) {
      return `enqueue failed: queue is full`;
    }
    if (!DataValidator.isValidPriority(priority)) {
      return 'enqueue failed: invalid priority';
    }
    const item: QueueItem = {
      id: this.generateId(),
      data: data ? 1 : 0,
      priority: priority,
      enqueuedAt: Date.now(),
      dataType: DataType.BOOLEAN
    };
    this.insertItem(item);
    this.enqueueCount++;
    this.updatedAt = Date.now();
    return `enqueue completed: id=${item.id}, data=${data}, priority=${priority}`;
  }

  dequeue(): string {
    if (this.queueSize === 0) {
      return 'dequeue failed: queue is empty';
    }
    let idx = 0;
    if (this.queueType === 'PRIORITY') {
      idx = this.findHighestPriorityIndex();
    } else if (this.queueType === 'LIFO') {
      idx = this.queueSize - 1;
    }
    const item = this.items[idx];
    this.removeItemAtIndex(idx);
    this.dequeueCount++;
    this.updatedAt = Date.now();
    return `dequeue: id=${item.id}, data=${item.data}, type=${item.dataType}, priority=${item.priority}`;
  }

  peek(): string {
    if (this.queueSize === 0) {
      return 'peek failed: queue is empty';
    }
    let idx = 0;
    if (this.queueType === 'PRIORITY') {
      idx = this.findHighestPriorityIndex();
    } else if (this.queueType === 'LIFO') {
      idx = this.queueSize - 1;
    }
    const item = this.items[idx];
    this.peekCount++;
    return `peek: id=${item.id}, data=${item.data}, type=${item.dataType}, priority=${item.priority}`;
  }

  peekAt(position: number): string {
    if (position < 0 || position >= this.queueSize) {
      return `peekAt failed: position ${position} out of bounds [0, ${this.queueSize})`;
    }
    const item = this.items[position];
    this.peekCount++;
    return `peekAt(${position}): id=${item.id}, data=${item.data}, priority=${item.priority}`;
  }

  size(): number {
    return this.queueSize;
  }

  isEmpty(): boolean {
    return this.queueSize === 0;
  }

  isFull(): boolean {
    return this.queueSize >= this.maxCapacity;
  }

  drain(count: number): string {
    if (count <= 0) {
      return 'drain failed: count must be positive';
    }
    if (count > this.queueSize) {
      count = this.queueSize;
    }
    const drained: string[] = [];
    for (let i = 0; i < count; i++) {
      let idx = 0;
      if (this.queueType === 'PRIORITY') {
        idx = this.findHighestPriorityIndex();
      } else if (this.queueType === 'LIFO') {
        idx = this.queueSize - 1;
      }
      const item = this.items[idx];
      drained.push(`${item.id}:${item.data}`);
      this.removeItemAtIndex(idx);
      this.dequeueCount++;
    }
    this.updatedAt = Date.now();
    return `drain(${count}): [${drained.join(', ')}]`;
  }

  peekAll(): string {
    if (this.queueSize === 0) {
      return 'peekAll: queue is empty';
    }
    const result: string[] = [];
    for (let i = 0; i < this.queueSize; i++) {
      result.push(`[${i}]${this.items[i].id}:${this.items[i].data}:p${this.items[i].priority}`);
    }
    this.peekCount++;
    return `peekAll: ${result.join(', ')}`;
  }

  clear(): string {
    const cleared = this.queueSize;
    this.items = [];
    this.queueSize = 0;
    this.updatedAt = Date.now();
    return `Queue cleared: ${cleared} items removed`;
  }

  batchEnqueueString(dataItems: string[], priority: number): string {
    if (dataItems.length === 0) {
      return 'batchEnqueue failed: empty input';
    }
    if (this.queueSize + dataItems.length > this.maxCapacity) {
      return `batchEnqueue failed: would exceed capacity (${this.queueSize}+${dataItems.length}>${this.maxCapacity})`;
    }
    let successCount = 0;
    for (let i = 0; i < dataItems.length; i++) {
      const item: QueueItem = {
        id: this.generateId(),
        data: dataItems[i],
        priority: priority,
        enqueuedAt: Date.now(),
        dataType: DataType.STRING
      };
      this.insertItem(item);
      successCount++;
    }
    this.enqueueCount += successCount;
    this.updatedAt = Date.now();
    return `batchEnqueue completed: ${successCount}/${dataItems.length} items`;
  }

  batchEnqueueNumber(dataItems: number[], priority: number): string {
    if (dataItems.length === 0) {
      return 'batchEnqueueNumber failed: empty input';
    }
    if (this.queueSize + dataItems.length > this.maxCapacity) {
      return `batchEnqueueNumber failed: would exceed capacity`;
    }
    let successCount = 0;
    for (let i = 0; i < dataItems.length; i++) {
      const item: QueueItem = {
        id: this.generateId(),
        data: dataItems[i],
        priority: priority,
        enqueuedAt: Date.now(),
        dataType: DataType.NUMBER
      };
      this.insertItem(item);
      successCount++;
    }
    this.enqueueCount += successCount;
    this.updatedAt = Date.now();
    return `batchEnqueueNumber completed: ${successCount}/${dataItems.length} items`;
  }

  batchDequeue(count: number): string {
    return this.drain(count);
  }

  toArray(): string {
    const result: string[] = [];
    for (let i = 0; i < this.queueSize; i++) {
      result.push(`{id:${this.items[i].id},data:${this.items[i].data},p:${this.items[i].priority},type:${this.items[i].dataType}}`);
    }
    return `[${result.join(',')}]`;
  }

  toJSON(): string {
    return this.toArray();
  }

  toSendableArray(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.queueSize; i++) {
      result.push(JSON.stringify(this.items[i]));
    }
    return result;
  }

  getStatistics(): string {
    return `Queue Statistics: type=${this.queueType}, size=${this.queueSize}, capacity=${this.maxCapacity}, ` +
      `enqueues=${this.enqueueCount}, dequeues=${this.dequeueCount}, peeks=${this.peekCount}, ` +
      `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`;
  }

  resetStatistics(): string {
    this.enqueueCount = 0;
    this.dequeueCount = 0;
    this.peekCount = 0;
    return 'Queue statistics reset';
  }

  isInitialized(): boolean {
    return this.createdAt > 0;
  }

  getQueueType(): string {
    return this.queueType;
  }

  getCapacity(): number {
    return this.maxCapacity;
  }

  release(): void {
    this.items = [];
    this.queueSize = 0;
    this.maxCapacity = DataStoreConstants.MAX_QUEUE_CAPACITY;
    this.queueType = 'FIFO';
    this.createdAt = 0;
    this.updatedAt = 0;
    this.enqueueCount = 0;
    this.dequeueCount = 0;
    this.peekCount = 0;
    Logger.info('SendableQueueManager released');
  }

  private generateId(): string {
    return `q_${Date.now()}_${this.queueSize}`;
  }

  private insertItem(item: QueueItem): void {
    const newItems: QueueItem[] = [];
    for (let i = 0; i < this.queueSize; i++) {
      newItems.push(this.items[i]);
    }
    newItems.push(item);
    this.items = newItems;
    this.queueSize++;
  }

  private removeItemAtIndex(idx: number): void {
    const newItems: QueueItem[] = [];
    for (let i = 0; i < this.queueSize; i++) {
      if (i !== idx) {
        newItems.push(this.items[i]);
      }
    }
    this.items = newItems;
    this.queueSize--;
  }

  private findHighestPriorityIndex(): number {
    if (this.queueSize === 0) {
      return 0;
    }
    let highestIdx = 0;
    let highestPriority = this.items[0].priority;
    for (let i = 1; i < this.queueSize; i++) {
      if (this.items[i].priority > highestPriority) {
        highestPriority = this.items[i].priority;
        highestIdx = i;
      }
    }
    return highestIdx;
  }
}
