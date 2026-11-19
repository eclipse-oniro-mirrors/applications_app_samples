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

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { preferences } from '@kit.ArkData';
import Logger from '../util/Logger';
import { EventSource } from '../util/Constants';
import { EventRecord, EventRecordManager } from './EventRecordManager';

const PREFERENCE_NAME: string = 'event_records';
const RECORD_KEY: string = 'records';
const EMPTY_TEXT: string = '';

/**
 * Destination of the persisted records, replaced by tests to avoid the file system.
 */
export interface RecordStorage {
    restore(): string;
    persist(text: string): void;
}

/**
 * Keeps the records in the preferences of the application.
 */
class PreferencesRecordStorage implements RecordStorage {
    private prefs: preferences.Preferences;

    constructor(prefs: preferences.Preferences) {
        this.prefs = prefs;
    }

    restore(): string {
        return this.prefs.getSync(RECORD_KEY, EMPTY_TEXT) as string;
    }

    persist(text: string): void {
        this.prefs.putSync(RECORD_KEY, text);
        this.prefs.flush().catch((error: BusinessError) => {
            Logger.error(`Failed to flush the event records, code: ${error.code}`);
        });
    }
}

/**
 * Saves the received events so that the home page can show them again after a restart.
 */
export class EventRecordStore {
    private storage: RecordStorage;

    /**
     * @param storage Destination of the persisted records.
     */
    constructor(storage: RecordStorage) {
        this.storage = storage;
    }

    /**
     * Creates the store backed by the preferences of the application.
     *
     * @param context Application context.
     * @returns Store that keeps the records in the preferences.
     */
    static async create(context: common.Context): Promise<EventRecordStore> {
        let options: preferences.Options = { name: PREFERENCE_NAME };
        let prefs: preferences.Preferences = await preferences.getPreferences(context, options);
        return new EventRecordStore(new PreferencesRecordStorage(prefs));
    }

    /**
     * Serializes the records as a JSON array of plain entries.
     *
     * @param records Records to serialize, in arrival order.
     * @returns JSON text that can be read back by deserialize.
     */
    static serialize(records: EventRecord[]): string {
        let entries: Record<string, Object>[] = [];
        for (let i: number = 0; i < records.length; i++) {
            let record: EventRecord = records[i];
            let entry: Record<string, Object> = {
                'data': record.data,
                'sourceCode': record.sourceCode,
                'receivedTime': record.receivedTime
            };
            entries.push(entry);
        }
        return JSON.stringify(entries);
    }

    /**
     * Reads the records back from the persisted text. Invalid JSON, unknown entries and
     * entries that would be rejected by tryAdd are skipped, the sequence numbers are
     * renumbered in arrival order and the source names are resolved again.
     *
     * @param text Persisted text, usually produced by serialize.
     * @returns Valid records in arrival order.
     */
    static deserialize(text: string): EventRecord[] {
        let records: EventRecord[] = [];
        if (text.length === 0) {
            return records;
        }
        let parsed: Object;
        try {
            parsed = JSON.parse(text);
        } catch (error) {
            return records;
        }
        if (!Array.isArray(parsed)) {
            return records;
        }
        let entries: Object[] = parsed as Object[];
        let sequence: number = 0;
        for (let i: number = 0; i < entries.length; i++) {
            let entry: Object | null = entries[i];
            if (entry === null) {
                continue;
            }
            let fields: Record<string, Object> = entry as Record<string, Object>;
            let data: Object | undefined = fields['data'];
            let sourceCode: Object | undefined = fields['sourceCode'];
            let receivedTime: Object | undefined = fields['receivedTime'];
            if (typeof data !== 'string' || typeof sourceCode !== 'number' || typeof receivedTime !== 'string') {
                continue;
            }
            let dataText: string = data as string;
            if (EventRecordManager.validateData(dataText).length > 0) {
                continue;
            }
            let code: number = sourceCode as number;
            if (EventRecordManager.validateSourceCode(code).length > 0) {
                continue;
            }
            sequence += 1;
            let record: EventRecord = {
                sequence: sequence,
                data: dataText,
                sourceCode: code,
                sourceName: EventSource.resolveName(code),
                receivedTime: receivedTime as string
            };
            records.push(record);
        }
        return records;
    }

    /**
     * Persists every record kept by the manager.
     *
     * @param manager Manager whose records are saved.
     * @returns Number of records that have been offered to the storage.
     */
    save(manager: EventRecordManager): number {
        let text: string = EventRecordStore.serialize(manager.getRecords());
        this.storage.persist(text);
        return manager.getCount();
    }

    /**
     * Restores the persisted records into the manager, dropping the oldest ones when the
     * capacity is exceeded.
     *
     * @param manager Manager that receives the restored records.
     * @returns Number of records kept by the manager after the restore.
     */
    loadInto(manager: EventRecordManager): number {
        let records: EventRecord[] = EventRecordStore.deserialize(this.storage.restore());
        manager.restore(records);
        return manager.getCount();
    }
}
