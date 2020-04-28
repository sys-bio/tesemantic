//
// Created by Ciaran on 4/4/2020.
//

#include "semsim/Subject.h"

namespace semsim {

    Subject::Subject(librdf_world *world, const RDFURINode &node)
            : world_(world) {
        this->rdf_node_ptr_ = std::make_shared<RDFURINode>(node);

    }

    Subject::Subject(librdf_world *world, const RDFBlankNode &node)
            : world_(world) {
        this->rdf_node_ptr_ = std::make_shared<RDFBlankNode>(node);
    }

    librdf_node *Subject::toRdfNode() const {
        //test for null!!
        return rdf_node_ptr_->toRdfNode();
    }

    std::string Subject::str() const {
        return rdf_node_ptr_->str();
    }


}