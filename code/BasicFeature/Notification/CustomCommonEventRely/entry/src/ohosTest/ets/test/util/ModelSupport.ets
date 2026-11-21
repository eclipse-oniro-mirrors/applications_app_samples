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

import { formBindingData } from '@kit.FormKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { ClockProvider } from '../../../../main/ets/feature/EventRecordManager';
import { EventPublisherLike } from '../../../../main/ets/feature/HomeStateModel';
import { LogSink } from '../../../../main/ets/util/Logger';
import { FormUpdater } from '../../../../main/ets/entryformability/EntryFormAbility';
import { RecordStorage } from '../../../../main/ets/feature/EventRecordStore';
import { CommonEventPublisher } from '../../../../main/ets/feature/CommonEventPublisher';
import { FormEventPublisher } from '../../../../main/ets/feature/FormEventService';
import { SubscriberFactory } from '../../../../main/ets/feature/SubscriptionManager';

/**
 * Reads the JSON payload of the binding data, which is declared as Object by the SDK.
 */
export function bindingJson(binding: formBindingData.FormBindingData): string {
    let value: Object = binding.data;
    if (typeof value === 'string') {
        return value as string;
    }
    return JSON.stringify(value);
}

/**
 * Clock that always returns the configured value and counts its calls.
 */
export class FakeClock implements ClockProvider {
    private value: number;
    private calls: number = 0;

    constructor(value: number) {
        this.value = value;
    }

    now(): number {
        this.calls += 1;
        return this.value;
    }

    getCalls(): number {
        return this.calls;
    }
}

/**
 * Publisher that records the publish requests and fails on demand.
 */
export class FakePublisher implements EventPublisherLike, FormEventPublisher {
    private shouldFail: boolean;
    private calls: number = 0;
    private lastData: string = '';
    private lastSourceCode: number = 0;

    constructor(shouldFail: boolean) {
        this.shouldFail = shouldFail;
    }

    publish(data: string, sourceCode: number): Promise<void> {
        this.calls += 1;
        this.lastData = data;
        this.lastSourceCode = sourceCode;
        if (this.shouldFail) {
            return Promise.reject(new Error('publish failed'));
        }
        return Promise.resolve();
    }

    getCalls(): number {
        return this.calls;
    }

    getLastData(): string {
        return this.lastData;
    }

    getLastSourceCode(): number {
        return this.lastSourceCode;
    }
}

/**
 * Single log record collected from the logger.
 */
export class SinkEntry {
    public level: string = '';
    public message: string = '';

    constructor(level: string, message: string) {
        this.level = level;
        this.message = message;
    }
}

/**
 * Log sink that keeps every record written by the logger.
 */
export class CollectingSink implements LogSink {
    private entries: SinkEntry[] = [];

    write(level: string, message: string): void {
        this.entries.push(new SinkEntry(level, message));
    }

    getCount(): number {
        return this.entries.length;
    }

    getLastLevel(): string {
        if (this.entries.length === 0) {
            return '';
        }
        return this.entries[this.entries.length - 1].level;
    }

    getLastMessage(): string {
        if (this.entries.length === 0) {
            return '';
        }
        return this.entries[this.entries.length - 1].message;
    }

    getMessageAt(index: number): string {
        if (index < 0 || index >= this.entries.length) {
            return '';
        }
        return this.entries[index].message;
    }

    getLevelAt(index: number): string {
        if (index < 0 || index >= this.entries.length) {
            return '';
        }
        return this.entries[index].level;
    }

    clear(): void {
        this.entries = [];
    }
}

/**
 * In-memory record storage that keeps the last persisted text.
 */
export class MemoryRecordStorage implements RecordStorage {
    private text: string;

    constructor(initial: string = '') {
        this.text = initial;
    }

    restore(): string {
        return this.text;
    }

    persist(text: string): void {
        this.text = text;
    }

    getText(): string {
        return this.text;
    }
}

/**
 * Subscriber factory that fails on demand, replaced by tests to avoid the framework.
 */
export class FakeSubscriberFactory implements SubscriberFactory {
    private mode: string;
    private errorCode: number;
    private calls: number = 0;
    private events: string[] = [];

    constructor(mode: string, errorCode: number = 401) {
        this.mode = mode;
        this.errorCode = errorCode;
    }

    create(events: string[]): Promise<commonEventManager.CommonEventSubscriber> {
        this.calls += 1;
        this.events = events;
        if (this.mode === 'throw') {
            throw new Error(`factory broken ${this.errorCode}`);
        }
        let error: BusinessError = { name: 'FactoryError', code: this.errorCode, message: 'subscriber unavailable' };
        return Promise.reject(error);
    }

    getCalls(): number {
        return this.calls;
    }

    getEventCount(): number {
        return this.events.length;
    }

    getFirstEvent(): string {
        if (this.events.length === 0) {
            return '';
        }
        return this.events[0];
    }
}

class FrameworkFormEventPublisher implements FormEventPublisher {
    publish(data: string, sourceCode: number): Promise<void> {
        return CommonEventPublisher.publish(data, sourceCode);
    }
}

/**
 * Form event publisher that delegates to the common event framework, used to
 * restore FormEventService after a test replaced its publisher.
 */
export function defaultFormPublisher(): FormEventPublisher {
    return new FrameworkFormEventPublisher();
}

/**
 * Widget refresh destination that records the binding data it receives.
 */
export class FakeFormUpdater implements FormUpdater {
    private shouldFail: boolean;
    private count: number = 0;
    private lastFormId: string = '';
    private lastJson: string = '';

    constructor(shouldFail: boolean) {
        this.shouldFail = shouldFail;
    }

    updateForm(formId: string, data: formBindingData.FormBindingData): Promise<void> {
        this.count += 1;
        this.lastFormId = formId;
        this.lastJson = bindingJson(data);
        if (this.shouldFail) {
            return Promise.reject(new Error('update failed'));
        }
        return Promise.resolve();
    }

    getCount(): number {
        return this.count;
    }

    getLastFormId(): string {
        return this.lastFormId;
    }

    getLastJson(): string {
        return this.lastJson;
    }
}