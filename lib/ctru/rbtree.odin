package ctru

// ============================================================
// Red-black tree
// 3ds/util/rbtree.h
//
// libctru's intrusive red-black tree (used by its allocators).
// ============================================================

rbtree_t :: rbtree

rbtree_node_t :: rbtree_node

rbtree_node_destructor_t :: #type proc "c" (Node: ^rbtree_node_t)

rbtree_node_comparator_t :: #type proc "c" (lhs: ^rbtree_node_t, rhs: ^rbtree_node_t) -> i32

// An rbtree node.
rbtree_node :: struct {
    parent_color: uintptr, // Parent color.
    child:        [2]^rbtree_node_t, // Node children.
}

// An rbtree.
rbtree :: struct {
    root:       ^rbtree_node_t, // Root node.
    comparator: rbtree_node_comparator_t, // Node comparator.
    size:       uint, // Size.
}

foreign import ctru "system:ctru"

@(default_calling_convention = "c")
foreign ctru {
    // Initializes an rbtree.
    rbtree_init :: proc(tree: ^rbtree_t, comparator: rbtree_node_comparator_t) ---

    // Gets whether an rbtree is empty
    rbtree_empty :: proc(tree: ^rbtree_t) -> i32 ---

    // Gets the size of an rbtree.
    rbtree_size :: proc(tree: ^rbtree_t) -> uint ---

    // Inserts a node into an rbtree.
    rbtree_insert :: proc(tree: ^rbtree_t, node: ^rbtree_node_t) -> ^rbtree_node_t ---

    // Inserts multiple nodes into an rbtree.
    rbtree_insert_multi :: proc(tree: ^rbtree_t, node: ^rbtree_node_t) ---

    // Finds a node within an rbtree.
    rbtree_find :: proc(tree: ^rbtree_t, node: ^rbtree_node_t) -> ^rbtree_node_t ---

    // Gets the minimum node of an rbtree.
    rbtree_min :: proc(tree: ^rbtree_t) -> ^rbtree_node_t ---

    // Gets the maximum node of an rbtree.
    rbtree_max :: proc(tree: ^rbtree_t) -> ^rbtree_node_t ---

    // Gets the next node from an rbtree node.
    rbtree_node_next :: proc(node: ^rbtree_node_t) -> ^rbtree_node_t ---

    // Gets the previous node from an rbtree node.
    rbtree_node_prev :: proc(node: ^rbtree_node_t) -> ^rbtree_node_t ---

    // Removes a node from an rbtree.
    rbtree_remove :: proc(tree: ^rbtree_t, node: ^rbtree_node_t, destructor: rbtree_node_destructor_t) -> ^rbtree_node_t ---

    // Clears an rbtree.
    rbtree_clear :: proc(tree: ^rbtree_t, destructor: rbtree_node_destructor_t) ---
}
