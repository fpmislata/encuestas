/*
 * Copyright 2013 Lorenzo González.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package es.logongas.encuestas.modelo.seguridad;

/**
 *
 * @author Lorenzo González
 */
public class Permission {
    private int idPermission;
    private String entityName;
    private PermissionType create;
    private PermissionType insert;
    private PermissionType update;
    private PermissionType delete;
    private PermissionType read;
    private PermissionType search;
    private PermissionType namedSearch;
    private PermissionType metadata;

    /**
     * @return the idPermission
     */
    public int getIdPermission() {
        return idPermission;
    }

    /**
     * @param idPermission the idPermission to set
     */
    public void setIdPermission(int idPermission) {
        this.idPermission = idPermission;
    }

    /**
     * @return the entityName
     */
    public String getEntityName() {
        return entityName;
    }

    /**
     * @param entityName the entityName to set
     */
    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    /**
     * @return the create
     */
    public PermissionType getCreate() {
        return create;
    }

    /**
     * @param create the create to set
     */
    public void setCreate(PermissionType create) {
        this.create = create;
    }

    /**
     * @return the insert
     */
    public PermissionType getInsert() {
        return insert;
    }

    /**
     * @param insert the insert to set
     */
    public void setInsert(PermissionType insert) {
        this.insert = insert;
    }

    /**
     * @return the update
     */
    public PermissionType getUpdate() {
        return update;
    }

    /**
     * @param update the update to set
     */
    public void setUpdate(PermissionType update) {
        this.update = update;
    }

    /**
     * @return the delete
     */
    public PermissionType getDelete() {
        return delete;
    }

    /**
     * @param delete the delete to set
     */
    public void setDelete(PermissionType delete) {
        this.delete = delete;
    }

    /**
     * @return the read
     */
    public PermissionType getRead() {
        return read;
    }

    /**
     * @param read the read to set
     */
    public void setRead(PermissionType read) {
        this.read = read;
    }

    /**
     * @return the search
     */
    public PermissionType getSearch() {
        return search;
    }

    /**
     * @param search the search to set
     */
    public void setSearch(PermissionType search) {
        this.search = search;
    }

    /**
     * @return the namedSearch
     */
    public PermissionType getNamedSearch() {
        return namedSearch;
    }

    /**
     * @param namedSearch the namedSearch to set
     */
    public void setNamedSearch(PermissionType namedSearch) {
        this.namedSearch = namedSearch;
    }

    /**
     * @return the metadata
     */
    public PermissionType getMetadata() {
        return metadata;
    }

    /**
     * @param metadata the metadata to set
     */
    public void setMetadata(PermissionType metadata) {
        this.metadata = metadata;
    }

}
