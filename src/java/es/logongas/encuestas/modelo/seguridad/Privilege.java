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
public class Privilege {
    private int idPrivilege;
    private String entityName;
    private boolean create;
    private boolean insert;
    private boolean update;
    private boolean delete;
    private boolean read;
    private boolean search;
    private boolean namedSearch;
    private boolean metadata;

    /**
     * @return the idPrivilege
     */
    public int getIdPrivilege() {
        return idPrivilege;
    }

    /**
     * @param idPrivilege the idPrivilege to set
     */
    public void setIdPrivilege(int idPrivilege) {
        this.idPrivilege = idPrivilege;
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
    public boolean isCreate() {
        return create;
    }

    /**
     * @param create the create to set
     */
    public void setCreate(boolean create) {
        this.create = create;
    }

    /**
     * @return the insert
     */
    public boolean isInsert() {
        return insert;
    }

    /**
     * @param insert the insert to set
     */
    public void setInsert(boolean insert) {
        this.insert = insert;
    }

    /**
     * @return the update
     */
    public boolean isUpdate() {
        return update;
    }

    /**
     * @param update the update to set
     */
    public void setUpdate(boolean update) {
        this.update = update;
    }

    /**
     * @return the delete
     */
    public boolean isDelete() {
        return delete;
    }

    /**
     * @param delete the delete to set
     */
    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    /**
     * @return the read
     */
    public boolean isRead() {
        return read;
    }

    /**
     * @param read the read to set
     */
    public void setRead(boolean read) {
        this.read = read;
    }

    /**
     * @return the search
     */
    public boolean isSearch() {
        return search;
    }

    /**
     * @param search the search to set
     */
    public void setSearch(boolean search) {
        this.search = search;
    }

    /**
     * @return the namedSearch
     */
    public boolean isNamedSearch() {
        return namedSearch;
    }

    /**
     * @param namedSearch the namedSearch to set
     */
    public void setNamedSearch(boolean namedSearch) {
        this.namedSearch = namedSearch;
    }

    /**
     * @return the metadata
     */
    public boolean isMetadata() {
        return metadata;
    }

    /**
     * @param metadata the metadata to set
     */
    public void setMetadata(boolean metadata) {
        this.metadata = metadata;
    }

    @Override
    public String toString() {
        return ""+idPrivilege;
    }


}
