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

import Logger from '../util/Logger';
import { CommonEventConstants } from '../util/Constants';
import { CommonEventPublisher } from './CommonEventPublisher';
import { AddResult, EventRecord, EventRecordManager } from './EventRecordManager';
import { EventRecordStore } from './EventRecordStore';

/**
 * State shown by the home page.
 */
export enum HomeStatus {
    READY = 0,
    SUBSCRIBED = 1,
    SUBSCRIBE_FAILED = 2,
    UNSUBSCRIBED = 3,
    PUBLISHING = 4,
    PUBLISH_SUCCESS = 5,
    PUBLISH_FAILED = 6,
    EVENT_RECEIVED = 7,
    CLEARED = 8
}

/**
 * Publishes the event triggered by the home page, replaced by tests to avoid the framework.
 */
export interface EventPublisherLike {
    publish(data: string, sourceCode: number): Promise<void>;
}

class PagePublisher implements EventPublisherLike {
    publish(data: string, sourceCode: number): Promise<void> {
        return CommonEventPublisher.publish(data, sourceCode, false);
    }
}

const PAGE_PUBLISHER: EventPublisherLike = new PagePublisher();

/**
 * Snapshot of the state shown by the home page.
 */
export interface HomeSnapshot {
    status: HomeStatus;
    subscribed: boolean;
    operating: boolean;
    count: number;
    lastData: string;
    lastSource: number;
    firstSequence: number;
    lastSequence: number;
}

/**
 * Keeps the subscription state, the publish state and the received events of the home page.
 */
export class HomeStateModel {
    /**
     * Source code kept while no event has been received.
     */
    static readonly NO_SOURCE: number = -1;

    private manager: EventRecordManager;
    private publisher: EventPublisherLike;
    private store: EventRecordStore | null = null;
    private subscribed: boolean = false;
    private operating: boolean = false;
    private status: HomeStatus = HomeStatus.READY;
    private receivedCount: number = 0;
    private lastEventData: string = CommonEventConstants.EMPTY_VALUE;
    private lastSourceCode: number = HomeStateModel.NO_SOURCE;

    /**
     * @param manager Keeps the received events.
     * @param publisher Publishes the event triggered by the home page.
     */
    constructor(manager: EventRecordManager = new EventRecordManager(),
        publisher: EventPublisherLike = PAGE_PUBLISHER) {
        this.manager = manager;
        this.publisher = publisher;
    }

    isSubscribed(): boolean {
        return this.subscribed;
    }

    isOperating(): boolean {
        return this.operating;
    }

    getStatus(): HomeStatus {
        return this.status;
    }

    getRecords(): EventRecord[] {
        return this.manager.getRecords();
    }

    getReceivedCount(): number {
        return this.receivedCount;
    }

    getLastEventData(): string {
        return this.lastEventData;
    }

    getLastSourceCode(): number {
        return this.lastSourceCode;
    }

    /**
     * @returns Every value shown by the home page, in a stable field order.
     */
    snapshot(): HomeSnapshot {
        let records: EventRecord[] = this.manager.getRecords();
        let firstSequence: number = records.length === 0 ? -1 : records[0].sequence;
        let lastSequence: number = records.length === 0 ? -1 : records[records.length - 1].sequence;
        return {
            status: this.status,
            subscribed: this.subscribed,
            operating: this.operating,
            count: this.receivedCount,
            lastData: this.lastEventData,
            lastSource: this.lastSourceCode,
            firstSequence: firstSequence,
            lastSequence: lastSequence
        };
    }

    /**
     * Replaces the destination of the persisted records.
     *
     * @param store Store that saves and restores the records.
     */
    setStore(store: EventRecordStore): void {
        this.store = store;
    }

    /**
     * Persists the kept records so that the home page can show them again after a restart.
     */
    persist(): void {
        if (this.store === null) {
            return;
        }
        this.store.save(this.manager);
    }

    /**
     * Restores the persisted records without changing the current status.
     */
    restore(): void {
        if (this.store === null) {
            return;
        }
        this.store.loadInto(this.manager);
        this.receivedCount = this.manager.getCount();
        let last: EventRecord | null = this.manager.getLastRecord();
        if (last !== null) {
            this.lastEventData = last.data;
            this.lastSourceCode = last.sourceCode;
        }
    }

    /**
     * Marks the subscription as established.
     */
    markSubscribed(): void {
        this.subscribed = true;
        this.status = HomeStatus.SUBSCRIBED;
    }

    /**
     * Marks the subscription as failed.
     */
    markSubscribeFailed(): void {
        this.subscribed = false;
        this.status = HomeStatus.SUBSCRIBE_FAILED;
    }

    /**
     * Marks the subscription as released.
     */
    markUnsubscribed(): void {
        this.subscribed = false;
        this.status = HomeStatus.UNSUBSCRIBED;
    }

    /**
     * Publishes the event once, ignoring the request while a publish is running.
     *
     * @param data Event data carried by the event.
     * @param sourceCode Publisher source carried by the code field.
     * @returns True when the publish succeeded.
     */
    async publish(data: string, sourceCode: number): Promise<boolean> {
        if (this.operating) {
            return false;
        }
        this.operating = true;
        this.status = HomeStatus.PUBLISHING;
        try {
            await this.publisher.publish(data, sourceCode);
            this.status = HomeStatus.PUBLISH_SUCCESS;
            return true;
        } catch (error) {
            this.status = HomeStatus.PUBLISH_FAILED;
            Logger.error(`Failed to publish the custom common event: ${(error as Error).message}`);
            return false;
        } finally {
            this.operating = false;
        }
    }

    /**
     * Records a received event and refreshes the latest event state.
     *
     * @param eventData Event data carried by the received event.
     * @param sourceCode Code field carried by the received event.
     * @returns The added record, null when the event has been rejected.
     */
    handleEvent(eventData: string, sourceCode: number): EventRecord | null {
        let result: AddResult = this.manager.tryAdd(eventData, sourceCode);
        if (result.record === null) {
            Logger.warn(`Rejected the received event: ${result.reason}`);
            return null;
        }
        let record: EventRecord = result.record;
        this.receivedCount = this.manager.getCount();
        this.lastEventData = record.data;
        this.lastSourceCode = record.sourceCode;
        this.status = HomeStatus.EVENT_RECEIVED;
        Logger.info(`Received the custom common event, data: ${record.data}, source: ${record.sourceName}`);
        return record;
    }

    /**
     * Removes every record and restores the latest event state.
     */
    clear(): void {
        this.manager.clear();
        this.receivedCount = 0;
        this.lastEventData = CommonEventConstants.EMPTY_VALUE;
        this.lastSourceCode = HomeStateModel.NO_SOURCE;
        this.status = HomeStatus.CLEARED;
    }
}