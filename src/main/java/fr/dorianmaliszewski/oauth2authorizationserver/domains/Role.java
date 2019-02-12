package fr.dorianmaliszewski.oauth2authorizationserver.domains;

import fr.dorianmaliszewski.oauth2authorizationserver.enums.RoleEnum;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
public class Role extends BaseEntity {
    @Enumerated(value = EnumType.STRING)
    private RoleEnum name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "role_permissions",
            joinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id")
    )
    private List<Permission> permissions;
}
