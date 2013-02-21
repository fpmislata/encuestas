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

import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author Lorenzo González
 */
public class Role {
    private int idRole;
    private String name;
    private Set<Privilege> privileges=new HashSet<Privilege>();

    private Set<UserRole> users=new HashSet<UserRole>();
    
    /**
     * @return the idRole
     */
    public int getIdRole() {
        return idRole;
    }

    /**
     * @param idRole the idRole to set
     */
    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the privileges
     */
    public Set<Privilege> getPrivileges() {
        return privileges;
    }

    /**
     * @param privileges the privileges to set
     */
    public void setPrivileges(Set<Privilege> privileges) {
        this.privileges = privileges;
    }

    @Override
    public String toString() {
        return name;
    }

    /**
     * @return the users
     */
    public Set<UserRole> getUsers() {
        return users;
    }

    /**
     * @param users the users to set
     */
    public void setUsers(Set<UserRole> users) {
        this.users = users;
    }


}
